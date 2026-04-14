/* Copyright (C) 2016 ultitech - All Rights Reserved
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE', which is part of this source code package.
 */

#version 150

uniform sampler2DRect Image;

out vec4 fragColor;

void main()
{
	fragColor = texture(Image, gl_FragCoord.xy);
}
