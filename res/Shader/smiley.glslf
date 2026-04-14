/* Procedural Win95-style smiley face on a camera-facing billboard. */

#version 150

in vec3 position;
in vec2 texcoord;

out vec4 fragColor;

void main()
{
	vec2 uv = texcoord - 0.5;
	float dist = length(uv);

	float face_r = 0.45;
	if(dist > face_r) discard;

	vec3 yellow = vec3(1.0, 0.85, 0.1);
	vec3 black = vec3(0.0);
	vec3 color = yellow;

	if(dist > face_r - 0.03) color = black;

	vec2 le = uv - vec2(-0.15, 0.12);
	vec2 re = uv - vec2( 0.15, 0.12);
	if(length(le) < 0.06) color = black;
	if(length(re) < 0.06) color = black;

	vec2 m = uv - vec2(0.0, 0.05);
	float mr = length(m);
	if(mr > 0.20 && mr < 0.24 && m.y < -0.05) color = black;

	float x = length(position);
	float intensity = 1.0/(1.1+3.0*x*x) + 0.1;
	fragColor = vec4(color * intensity, 1.0);
}
