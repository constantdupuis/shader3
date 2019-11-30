#version 300 es

precision mediump float;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

out vec4 outColor;

void main(){
	vec2 st=gl_FragCoord.xy/u_resolution.xy;
	st.x*=u_resolution.x/u_resolution.y;
  st *= 2.0;
  st -= 1.0;

  float d = distance(vec2(0., 0.), vec2(0.2, 0.2) );

  vec3 color = vec3(d, 0., 0.0);
	outColor=vec4(color,1.);
}