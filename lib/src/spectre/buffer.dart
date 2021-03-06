/*
  Copyright (C) 2013 John McCutchan

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

part of spectre;

/** A [SpectreBuffer] represents a buffer of memory on the GPU.
 * A [SpectreBuffer] can only be constructed by constructing an [IndexBuffer]
 * or a [VertexBuffer].
 */
class SpectreBuffer extends DeviceChild {
  WebGL.Buffer _deviceBuffer;
  final int _bindTarget;
  final int _bindingParam;
  int _usage = UsagePattern.DynamicDraw;
  int _size = 0;

  SpectreBuffer(String name, GraphicsDevice device,
                this._bindTarget, this._bindingParam)
      : super._internal(name, device) {
    _deviceBuffer = device.gl.createBuffer();
  }

  void finalize() {
    super.finalize();
    device.gl.deleteBuffer(_deviceBuffer);
    _deviceBuffer = null;
  }

  WebGL.Buffer _pushBind() {
    var oldBind = device.gl.getParameter(_bindingParam);
    device.gl.bindBuffer(_bindTarget, _deviceBuffer);
    return oldBind;
  }

  void _bind() {
    device.gl.bindBuffer(_bindTarget, _deviceBuffer);
  }

  void _popBind(WebGL.Buffer oldBind) {
    device.gl.bindBuffer(_bindTarget, oldBind);
  }

  void _uploadData(TypedData data, int usage) {
    _size = data.lengthInBytes;
    _usage = usage;
    device.gl.bufferDataTyped(_bindTarget, data, usage);
  }

  /** Resize buffer to fit [data]. Upload [data] with [usage] hint. */
  void uploadData(TypedData data, int usage) {
    if (data == null) {
      throw new ArgumentError('data cannot be null.');
    }
    var oldBind = _pushBind();
    _uploadData(data, usage);
    _popBind(oldBind);
  }

  void _uploadSubData(int offset, TypedData data) {
    device.gl.bufferSubDataTyped(_bindTarget, offset, data);
  }

  /** Starting at [offset], upload [data] into buffer.
   * The length of [data] + offset must not exceed the size of the buffer
   */
  void uploadSubData(int offset, TypedData data) {
    if (data == null) {
      throw new ArgumentError('data cannot be null.');
    }
    if (offset + data.lengthInBytes > _size) {
      throw new RangeError('data is too large ${offset + data.lengthInBytes} '
                           '> ${_size}');
    }
    var oldBind = _pushBind();
    _uploadSubData(offset, data);
    _popBind(oldBind);
  }

  void _allocate(int size, int usage) {
    _size = size;
    _usage = usage;
    device.gl.bufferData(_bindTarget, size, usage);
  }

  /** Resize buffer to be [size] bytes with [usage] hint. */
  void allocate(int size, int usage) {
    if (size <= 0) {
      throw new ArgumentError('size must be > 0');
    }
    var oldBind = _pushBind();
    _allocate(size, usage);
    _popBind(oldBind);
  }

  /** Query the size of the buffer */
  int get size => _size;

  /** Query the usage hint of the buffer */
  int get usage => _usage;
}
