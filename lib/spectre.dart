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

/** Spectre Library */

library spectre;

import 'dart:html';
import 'dart:web_gl' as WebGL;
import 'dart:json' as JSON;
import 'dart:async';
import 'dart:math' as Math;
import 'dart:typed_data';
import 'package:logging/logging.dart';
import 'package:vector_math/vector_math.dart';
import 'package:vector_math/vector_math_operations.dart';
import 'package:spectre/disposable.dart';

part 'src/spectre/device_child.dart';
part 'src/spectre/blend.dart';
part 'src/spectre/blend_operation.dart';
part 'src/spectre/blend_state.dart';
part 'src/spectre/buffer.dart';
part 'src/spectre/camera.dart';
part 'src/spectre/camera_controller.dart';
part 'src/spectre/compare_function.dart';
part 'src/spectre/cull_mode.dart';
part 'src/spectre/data_type.dart';
part 'src/spectre/debug_draw_manager.dart';
part 'src/spectre/depth_state.dart';
part 'src/spectre/enum.dart';
part 'src/spectre/shader.dart';
part 'src/spectre/fragment_shader.dart';
part 'src/spectre/front_face.dart';
part 'src/spectre/graphics_context.dart';
part 'src/spectre/graphics_device.dart';
part 'src/spectre/graphics_device_capabilities.dart';
part 'src/spectre/graphics_device_config.dart';
part 'src/spectre/index_buffer.dart';
part 'src/spectre/input_layout.dart';
part 'src/spectre/fps_fly_camera_controller.dart';
part 'src/spectre/orbit_camera_controller.dart';
part 'src/spectre/pixel_format.dart';
part 'src/spectre/primitive_topology.dart';
part 'src/spectre/rasterizer_state.dart';
part 'src/spectre/render_buffer.dart';
part 'src/spectre/render_target.dart';
part 'src/spectre/sampler_state.dart';
part 'src/spectre/shader_program.dart';
part 'src/spectre/stencil_state.dart';
part 'src/spectre/surface_format.dart';
part 'src/spectre/texture.dart';
part 'src/spectre/texture_address_mode.dart';
part 'src/spectre/texture_cube.dart';
part 'src/spectre/texture_mag_filter.dart';
part 'src/spectre/texture_min_filter.dart';
part 'src/spectre/texture_2d.dart';
part 'src/spectre/usage_pattern.dart';
part 'src/spectre/vertex_buffer.dart';
part 'src/spectre/vertex_shader.dart';
part 'src/spectre/viewport.dart';
part 'src/spectre/mesh.dart';
part 'src/spectre/skeleton.dart';
part 'src/spectre/skeleton_animation.dart';
part 'src/spectre/skinned_mesh.dart';
part 'src/spectre/vertex_attribute.dart';

// The global logger for spectre
final Logger _spectreLog = new Logger('Spectre');
