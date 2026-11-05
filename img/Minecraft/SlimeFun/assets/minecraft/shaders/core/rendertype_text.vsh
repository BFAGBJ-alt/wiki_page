#version 150

precision highp float;






#define hue(v)  ((.6+.6*cos(6.*(v)+vec4(0, 23, 21, 1)))+vec4(0., 0., 0., 1.) )

#define finalize() { \
    vertexDistance=length((ModelViewMat*vertex).xyz); \
    texCoord0=UV0; \
}

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;


uniform sampler2D Sampler0;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

uniform float GameTime;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

float safeGameTime() {
    float gameTime=GameTime;
    
    if(gameTime <= 0) {
        gameTime=.5;
    }
    return gameTime;
}

float scaledTime() {
    return safeGameTime()*12000.;
}

void f_afccc16d(inout vec4 vertex) {
    gl_Position=ProjMat*ModelViewMat*vertex;
}

void f_cc69cc4d() {
    vertexColor=Color*texelFetch(Sampler2, UV2 / 16, 0);
}


void f_d7c4b78c(inout vec4 vertex) {
    f_afccc16d(vertex);
    if(Position.z==0. && gl_Position.x > .95) {
        vertexColor=vec4(0);
    }else{
        f_cc69cc4d();
    }
    finalize();
}



void f_dc5ad1f3() {
    vertexColor=hue(gl_Position.x+safeGameTime()*1000.)*texelFetch(Sampler2, UV2 / 16, 0);
}

void f_00a087f0() {
    gl_Position.y+=sin(scaledTime()+(gl_Position.x*6)) / 150.;
}

void f_3beb7de1(inout vec4 vertex) {
    f_afccc16d(vertex);
    f_dc5ad1f3();
    finalize();
}

void f_a3bf1a0a(inout vec4 vertex) {
    f_afccc16d(vertex);
    f_cc69cc4d();
    f_00a087f0();
    finalize();
}

void f_5b7819a7(inout vec4 vertex) {
    f_afccc16d(vertex);
    f_00a087f0();
    f_dc5ad1f3();
    finalize();
}

void f_ae6e6c04(inout vec4 vertex) {
    f_cc69cc4d();
    float vertexId=mod(gl_VertexID, 4.);
    if(vertex.z <= 0.) {
        if(vertexId==3. || vertexId==0.) {
            vertex.y+=cos(scaledTime() / 4)*.1;
            vertex.y+=max(cos(scaledTime() / 4)*.1, 0.);
        }
    }else{
        if(vertexId==3. || vertexId==0.) {
            vertex.y-=cos(scaledTime() / 4)*3;
            vertex.y-=max(cos(scaledTime() / 4)*4, 0.);
        }
    }
    f_afccc16d(vertex);
    finalize();
}

void f_7fc16f83(inout vec4 vertex) {
    float vertexId=mod(gl_VertexID, 4.);
    if(vertex.z <= 0.) {
        if(vertexId==3. || vertexId==0.) {
            vertex.y+=cos(scaledTime() / 4)*.1;
            vertex.y+=max(cos(scaledTime() / 4)*.1, 0.);
        }
    }else{
        if(vertexId==3. || vertexId==0.) {
            vertex.y-=cos(scaledTime() / 4)*3;
            vertex.y-=max(cos(scaledTime() / 4)*4, 0.);
        }
    }
    f_dc5ad1f3();
    f_afccc16d(vertex);
    finalize();
}

void f_a98916c7(inout vec4 vertex, float speed) {
    f_afccc16d(vertex);
    float blink=abs(sin(scaledTime()*speed));
    vertexColor=Color*blink*texelFetch(Sampler2, UV2 / 16, 0);
    finalize();
}



void f_cb6ff1e6(inout vec4 vertex) {
    f_afccc16d(vertex);
    f_cc69cc4d();
    vertexColor=vec4(1, 1, 1, vertexColor.a); 
    finalize();
}


void main() {
    vec4 vertex=vec4(Position, 1.);
    ivec3 iColor=ivec3(Color.xyz*255+vec3(.5));

    
    
    if(iColor==ivec3(255, 85, 85))
    {
        f_d7c4b78c(vertex);
        return;
    }
    

    
    if(fract(Position.z) < .1) {
        
        
        if(iColor==ivec3(19, 23, 9))
        {
            gl_Position=vec4(2, 2, 2, 1);
            f_cc69cc4d();
            finalize();
            return;
        }
        

        
        
        if(iColor==ivec3(57, 63, 63)) {
            
            
            f_afccc16d(vertex);
            f_cc69cc4d();
            finalize();
            return;
        }

        
        if(iColor==ivec3(57, 63, 62)) {
            f_a3bf1a0a(vertex);
            return;
        }

        
        if(iColor==ivec3(57, 62, 63)) {
            
            f_a3bf1a0a(vertex);
            return;
        }

        
        if(iColor==ivec3(57, 62, 62)) {
            f_ae6e6c04(vertex);
            return;
        }

        
        if(iColor==ivec3(57, 61, 63)) {
            f_ae6e6c04(vertex);
            return;
        }

        
        if(iColor==ivec3(57, 61, 62)) {
            f_a98916c7(vertex, .5);
            return;
        }

        

        
    }

    
    
    if(iColor==ivec3(78, 92, 36))
    {
        f_cb6ff1e6(vertex);
        return;
    }
    

    
    
    
    if(iColor==ivec3(230, 255, 254))
    {
        f_3beb7de1(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 255, 250))
    {
        f_a3bf1a0a(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 251, 254))
    {
        f_5b7819a7(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 251, 250))
    {
        f_ae6e6c04(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 247, 254))
    {
        f_7fc16f83(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 247, 250))
    {
        f_a98916c7(vertex, .5);
        return;
    }

    
    

    
    
    
    if(iColor==ivec3(255, 255, 254))
    {
        f_3beb7de1(vertex);
        return;
    }

    
    if(iColor==ivec3(255, 255, 253))
    {
        f_a3bf1a0a(vertex);
        return;
    }

    
    if(iColor==ivec3(255, 255, 25))
    {
        f_5b7819a7(vertex);
        return;
    }

    
    if(iColor==ivec3(255, 255, 251))
    {
        f_ae6e6c04(vertex);
        return;
    }

    
    if(iColor==ivec3(255, 254, 254))
    {
        f_7fc16f83(vertex);
        return;
    }
    

    
    f_afccc16d(vertex);
    f_cc69cc4d();
    finalize();
}