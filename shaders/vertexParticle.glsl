uniform float time;
varying vec2 vUv;
varying vec3 vPosition;
varying float vOpacity;
uniform sampler2D texture1;

attribute float opacity;

float PI=3.141592653589793238;
void main(){
    vUv=uv;
    vOpacity = opacity;

    vec4 mvPosition=modelViewMatrix*vec4(position,1.);
    gl_PointSize=30000.*(1./-mvPosition.z);
    gl_Position=projectionMatrix*mvPosition;
}