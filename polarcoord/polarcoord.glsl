#version 300 es

#define PI 3.1415926535897932384626433832795
#define TWO_PI (PI*2.)


precision mediump float;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

out vec4 outColor;
vec2 blob  = vec2(.2);

void main(){

    float time = u_time * -10.;
    // convert coord from pixel coordinate to 0 to 1
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    uv.x *= u_resolution.x / u_resolution.y; // fix screen aspect ratio 
    uv -= vec2((u_resolution.x / u_resolution.y)/2.0, 0.5); // center (0,0)

    blob = vec2(cos(u_time), sin(u_time));
    blob *= .2;
    vec2 puv = uv - blob;

    // crate rays
    // create polar coordinats
    // s rotate around centre 0 to 1
    // t got from center to edges 0 to 1  
    float s = (atan(puv.x, puv.y)+PI)/TWO_PI;
    float t = length(puv);

    float c = sin(time+s*TWO_PI*10.);
    c+= 1.;
    c/=2.;
    c = smoothstep(.6, .61, c);

    // create blob circle
    float d = 1./length( uv - blob );
    d /= 10.;
    d = smoothstep(1., 1.01, d);

    float color = smoothstep(.2, .5, c+d);

    outColor = vec4(vec3(color, color/3., 0.), 1.);

}
