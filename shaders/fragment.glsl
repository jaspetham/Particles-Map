uniform float time;
uniform float progress;
uniform sampler2D texture1;
uniform vec4 resolution;
varying vec2 vUv;
varying vec3 vPosition;
varying float vOpacity;

float PI=3.141592653589793238;
void main(){
    vec2 uv = vec2(gl_PointCoord.x,1. - gl_PointCoord.y);
    vec2 cUv = 2. * uv - 1.;

    vec3 originalColor = vec3(
        4./255.,
        (10.)/255., 
        (20.)/255.
    );

    vec4 color = vec4(0.08/length(cUv));

    color.rgb = min(vec3(10.),color.rgb);

    color.rgb *= originalColor * 1200.;

    color *= vOpacity;

    color.a = min(1.,color.a) * 10.;

    float disc = length(cUv);

    // vec2 newUV = (vUv - vec2(0.5))*resolution.zw + vec2(0.5);
    
    gl_FragColor = vec4(1. - disc,0.,0.,1.) * vOpacity;
    gl_FragColor = vec4(color.rgb,color.a);
}