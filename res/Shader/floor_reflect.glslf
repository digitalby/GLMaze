/* Copyright (C) 2016 ultitech - All Rights Reserved
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE', which is part of this source code package.
 */

#version 150

uniform sampler2D Diffuse;
uniform sampler2DRect Reflection;
uniform sampler2D Noise;

in vec3 position;
in vec2 texcoord;

out vec4 fragColor;

void main()
{
	vec3 tex_color = texture(Diffuse, texcoord).rgb;
	float x = length(position);
	float intensity = 1.0/(1.1+3.0*x*x) + 0.1;
	vec4 diffuse_color = vec4(tex_color*intensity, 1.0);

	vec2 t = gl_FragCoord.xy;
	t.x += texture(Noise, texcoord).a*10.0-5.0;
	t.y += texture(Noise, texcoord+0.5).a*10.0-5.0;
	vec4 reflect_color = texture(Reflection, t);

	float mix_fac = pow(texture(Noise, texcoord/5.0).g, 4.0);
	fragColor = mix(diffuse_color, reflect_color, mix_fac);
}
