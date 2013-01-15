part of spectre;

/*

  Copyright (C) 2012 John McCutchan <john@johnmccutchan.com>

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

class BlendOperation {
  /// The result is the destination added to the source.
  ///
  ///     Result = (Source Color * Source Blend) + (Destination Color * Destination Blend)
  static const int Add = WebGLRenderingContext.FUNC_ADD;
  /// String representation of [Add].
  static const String AddName = 'BlendOperation.Add';
  /// The result is the source subtracted from the destination.
  ///
  ///     Result = (Destination Color * Destination Blend) - (Source Color * Source Blend)
  static const int ReverseSubtract = WebGLRenderingContext.FUNC_REVERSE_SUBTRACT;
  /// String representation of [Subtract].
  static const String ReverseSubtractName = 'BlendOperation.ReverseSubtract';
  /// The result is the destination subtracted from the source.
  ///
  ///     Result = (Source Color * Source Blend) - (Destination Color * Destination Blend)
  static const int Subtract = WebGLRenderingContext.FUNC_SUBTRACT;
  /// String representation of [Subtract].
  static const String SubtractName = 'BlendOperation.Subtract';

  /// Convert from a [String] name to the corresponding [BlendOperation] enumeration.
  static int parse(String name) {
    if (name == AddName) {
      return Add;
    } else if (name == ReverseSubtractName) {
      return ReverseSubtract;
    } else if (name == SubtractName) {
      return Subtract;
    }

    assert(false);
    return Add;
  }

  /// Converts the [BlendOperation] enumeration to a [String].
  static String stringify(int value) {
    if (value == Add) {
      return AddName;
    } else if (value == ReverseSubtract) {
      return ReverseSubtractName;
    } else if (value == Subtract) {
      return SubtractName;
    }

    assert(false);
    return AddName;
  }

  /// Checks whether the value is a valid enumeration.
  ///
  /// Should be gotten rid of when enums are supported properly.
  static bool isValid(int value) {
    if (value == Add) {
      return true;
    } else if (value == ReverseSubtract) {
      return true;
    } else if (value == Subtract) {
      return true;
    }

    return false;
  }
}