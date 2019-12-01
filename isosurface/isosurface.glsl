#version 300 es

precision mediump float;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

out vec4 outColor;

vec2 blob;
vec2 blob2;

vec2 blobs[4];

void main(){
	vec2 st = gl_FragCoord.xy/u_resolution.xy;
	st.x *= u_resolution.x/u_resolution.y;
  st *= 2.0;
  st -= 1.0;

  blob = vec2( .0 + sin(u_time), .0 + cos(u_time));
  blob *= 0.7;
  float d = 1./length( blob - st );
  d /= 5.;

  blob2 = vec2(cos(u_time), sin(u_time)); 
  blob2 *= 0.55;
  float d2 = 1./length( blob2 - st );
  d2 /= 5.;
  //d2 = smoothstep( 1.0, 1.1, d2);
  
  float td = smoothstep( 1.0, 1.01,d+d2);

  vec3 color = vec3(0., td, 0.);
  //vec3 color = vec3(st.x, st.y, d);

	outColor = vec4(color,1.);
}