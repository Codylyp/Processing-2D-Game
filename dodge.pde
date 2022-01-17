PImage texture0, texture1, texture2, texture3;
boolean perspective = false;
float angleX;
float angleY;
float gap = 0.01;
float trans = 0;
float transGap = 0.01;
int count = 0;
int countMove = 0;
int rotateAngel;
int a;
float aGap = 2;
int spaceCount =0;
boolean moveLeft = false;
boolean moveRight = false;
boolean moveTop = false;
boolean moveDown = false;
int row = 12;
int col = 3;

int c1 = 255;
int c2 = 0;
int c3 = 0;
int num = 1;

float gp = 0.01;
float go;

float gpp = 0.01;
float goo;

Tile[][] world = new Tile[30][15];
vessel v;
UFO u;
sword s;
int worldCount = 30;


class Tile{
 float heights;
 float leftx;
 float lefty;
 PImage t;
 
 Tile(float x, float y, float h){
   heights = h; 
   leftx = x;
   lefty = y;
 }
 
 void drawTile(){
   float m=1;
   
  if(heights==0){
    float rand = random(100);
    noStroke();
    beginShape(QUADS);
    if(t==null){
     if(rand>=30){
     t= texture0;
     }else if(rand>=0&&rand<20){
     t= texture1;
     }else if(rand>=20&&rand<30){
     t= texture2;
     }
    }
    texture(t);
    vertex(leftx,lefty,0, 0,m);  
    vertex(leftx+0.15,lefty,0, m,m);
    vertex(leftx+0.15,lefty+0.15,0, m,0);
    vertex(leftx,lefty+0.15,0, 0,0);
    endShape();
  }else if(heights==0.15){
    stroke(255);
    fill(100,0,0);
    pushMatrix();
    translate(leftx+0.075,lefty+0.075,0.075);
    box(0.15);
    popMatrix();
    
  }else if(heights==0.3){
    t= texture3;
    texture(t);
    vertex(leftx,lefty,0, 0,m);  
    vertex(leftx+0.15,lefty,0, m,m);
    vertex(leftx+0.15,lefty+0.15,0, m,0);
    vertex(leftx,lefty+0.15,0, 0,0);
    endShape();
    stroke(255);

    fill(60,110,0);
    pushMatrix();
    translate(0,0,go);
    translate(leftx+0.075,lefty+0.075,0.075);   
    
    box(0.15);    
    popMatrix();
  }else if(heights==0.45){
    t= texture3;
    texture(t);
    vertex(leftx,lefty,0, 0,m);  
    vertex(leftx+0.15,lefty,0, m,m);
    vertex(leftx+0.15,lefty+0.15,0, m,0);
    vertex(leftx,lefty+0.15,0, 0,0);
    endShape();
    stroke(255);
    fill(200,110,0);
    pushMatrix();
    translate(leftx+0.075,lefty+0.075,0.375);
    rotate(radians(rotateAngel));
    box(0.15);
    rotate(radians(45));
    box(0.15);    
    popMatrix();
  }
 }
}

class vessel{
  float leftx;
  float lefty;
  float rightx;
  float righty;
  float topx;
  float topy;
  float h;
  
  vessel(float leftx,float lefty,float rightx,float righty,float topx,float topy,float h){
    this.leftx = leftx;
    this.lefty = lefty;
    this.rightx = rightx;
    this.righty = righty;
    this.topx = topx;
    this.topy = topy;
    this.h = h;
  }
  void drawVessel(){
    stroke(0);
  fill(255,255,0);
  beginShape(QUADS);
  vertex(rightx,righty,h);
  vertex(rightx,righty,h+0.02);
  vertex(leftx,lefty,h+0.02);
  vertex(leftx,lefty,h);
  vertex(leftx,lefty,h+0.02);
  vertex(leftx,lefty,h);
  vertex(topx,topy,h);
  vertex(topx,topy,h+0.02);
  vertex(topx,topy,h);
  vertex(topx,topy,h+0.02);
  vertex(rightx,righty,h+0.02);
  vertex(rightx,righty,h);
  endShape();
  beginShape(TRIANGLES);
  vertex(leftx,lefty,h);
  vertex(rightx,righty,h);
  vertex(topx,topy,h);
  vertex(leftx,lefty,h+0.02);
  vertex(rightx,righty,h+0.02);
  vertex(topx,topy,h+0.02);
  fill(c1,c2,c3);
  vertex(rightx,righty,h+0.02); // head
  vertex(leftx,righty,h+0.07);
  vertex(leftx,righty-0.01,h+0.02);
  vertex(leftx,righty,h+0.07);
  vertex(leftx,righty-0.01,h+0.02);
  vertex(leftx,righty+0.01,h+0.02);
  vertex(leftx,righty,h+0.07);
  vertex(leftx,righty-0.01,h+0.02);
  vertex(leftx,righty+0.01,h+0.02);
  endShape();
 } 
}

class UFO{
  float leftx;
  float lefty;
  float rightx;
  float righty;
  float topx;
  float topy;
  float h;
  
  UFO(float leftx,float lefty,float rightx,float righty,float topx,float topy,float h){
    this.leftx = leftx;
    this.lefty = lefty;
    this.rightx = rightx;
    this.righty = righty;
    this.topx = topx;
    this.topy = topy;
    this.h = h;
  }
  void drawUFO(){
    fill(0,255,255);
    pushMatrix();
    translate(leftx+0.075,lefty+0.075,0.475);
    rotate(radians(rotateAngel));
    scale(1,1,0.3);
    box(0.15);
    rotate(radians(45));
    box(0.15);
    translate(0,0,0.1);
    fill(255,0,0);
    box(0.05);
    popMatrix();
 } 
}

class sword{
  float leftx;
  float lefty;
  float rightx;
  float righty;
  float topx;
  float topy;
  float h;
  
  sword(float leftx,float lefty,float rightx,float righty,float topx,float topy,float h){
    this.leftx = leftx;
    this.lefty = lefty;
    this.rightx = rightx;
    this.righty = righty;
    this.topx = topx;
    this.topy = topy;
    this.h = h;
  }
  void drawSword(){
    fill(200,0,200);
    pushMatrix();
    translate(0,goo,0);
    
    translate(leftx+0.075,lefty+0.075,0.675);
    pushMatrix();
    scale(0.2,1,0.2);
    box(0.15);
    popMatrix();
    
    pushMatrix();
    rotate(radians(45));
    scale(1,0.2,0.2);
    fill(200,100,200);
    box(0.15);
    popMatrix();
    
    rotate(radians(-45));
    scale(1,0.2,0.2);
    fill(200,100,200);
    box(0.15);
    popMatrix();
 } 
}

void initialVessel(){
  v = new vessel(12*0.15-2.4,3*0.15-1.15,13*0.15-2.4,3.5*0.15-1.15,12*0.15-2.4,4*0.15-1.15,0.1);
}

void initialUFO(){
  u = new UFO(12*0.15-2.4,4*0.15-1.15,13*0.15-2.4,4.5*0.15-1.15,12*0.15-2.4,5*0.15-1.15,0.4);
}

void initialSword(){
  s = new sword(14*0.15-2.4,8*0.15-1.15,15*0.15-2.4,8.5*0.15-1.15,14*0.15-2.4,9*0.15-1.15,0.2);
}

void updateVessel(){
 v.leftx += 0.15;
 v.rightx += 0.15;
 v.topx += 0.15;
}

void drawWorld(){ 
  for(int i=0; i<worldCount; i++){
   for(int j=0; j<15; j++){
     world[i][j].drawTile();
   }
  }
}

void updateWorld(){

for(int i=0; i<29; i++){
 for(int j=0; j<15; j++){
  world[i][j].leftx = world[i+1][j].leftx;
  world[i][j].heights = world[i+1][j].heights;
  world[i][j].t = world[i+1][j].t;
 }
}
for(int j=0; j<15; j++){
  world[29][j].leftx = world[28][j].leftx+0.15;
  world[29][j].heights = world[0][j].heights;
  world[29][j].t = world[0][j].t;
 }

}


void initialWorld(){
  int r1;
  int r2;
  int r3;
  for(int i=0; i<30; i++){
    r1 = int(random(15));
    r2 = int(random(15));
    r3 = int(random(15));
   for(int j=0; j<15; j++){
     if((j==r1)&&i%2==0)
     world[i][j] = new Tile(i*0.15-2.4,j*0.15-1.15,0.15);
     else if(j==r2&&i%7==0)
     world[i][j] = new Tile(i*0.15-2.4,j*0.15-1.15,0.3);
     else if(j==r3&&i%11==0)
     world[i][j] = new Tile(i*0.15-2.4,j*0.15-1.15,0.45);
     else
     world[i][j] = new Tile(i*0.15-2.4,j*0.15-1.15,0);
   }
  }
}



boolean check(){
  boolean result = false;
  if(world[row][col].heights>v.h){
  result = true;
   if(world[row][col].heights==0.15){   
    c1 = 100;
    c2 = 0;
   }else if(world[row][col].heights==0.3){
     c1 = 60;
     c2 = 110;
   }else if(world[row][col].heights==0.45){
     c1 = 200;
     c2 = 110;
   }
  }
  return result;
}

boolean checkLeft(){
  boolean result = false;
  if(world[row][col+1].heights>v.h||world[row+1][col+1].heights>v.h){
  result = true;
  }
  return result;
}

boolean checkRight(){
  boolean result = false;
  if(world[row][col-1].heights>v.h||world[row+1][col-1].heights>v.h){
  result = true;
  }
  return result;
}

boolean checkDown(){
  boolean result = false;
  if(world[row-1][col].heights>v.h||world[row][col].heights>v.h){
  result = true;
  }
  return result;
}

boolean checkCollision(){
  boolean result = false;
  for(int i=0; i<30; i++){
   for(int j=0; j<15; j++){
     if(world[i][j].leftx==v.rightx&&world[i][j].lefty==v.lefty)
    if(world[i][j].lefty==v.righty&&world[i][j].heights>v.h)
    result = true;
   }
  }
  return result;
}

void setup() {
  size(640, 640, P3D);  
  textureMode(NORMAL);
  texture0 = loadImage("TexturesCom_ConcreteBunker0250_2_seamless_S.jpg");
  texture1 = loadImage("TexturesCom_ConcreteBunkerDamaged0052_2_S.jpg");
  texture2 = loadImage("TexturesCom_ConcreteFloors0081_1_seamless_S.jpg");
  texture3 = loadImage("TexturesCom_BunkerPainted0004_1_seamless_S.jpg");
  
  textureWrap(REPEAT);
  initialWorld();
  initialVessel();
  initialUFO();
  initialSword();
}

void draw(){
  background(0);
  resetMatrix();
  
 if (perspective){
    frustum(-1, 1, 1, -1, 2.5, 8);
    translate(0, -1.6, -5);
    rotateX(radians(-90));
    rotate(radians(90));   
 }
  else{
  ortho(-1, 1, 1, -1, -2, 2);  
  rotateX(radians(-50));  
  rotate(radians(45));
  }
  
  pushMatrix();
  if(moveLeft){
   v.lefty+=transGap;
   v.righty+=transGap;
   v.topy+=transGap;
   translate((v.leftx+v.rightx+0.0)/2,(v.lefty+v.righty+0.0)/2,v.h);
   rotateX(radians(-a));
   translate(-(v.leftx+v.rightx+0.0)/2,-(v.lefty+v.righty+0.0)/2,-v.h);
   a+=aGap;
   countMove++;
   if(countMove==15){
    countMove = 0;
    a = 0;
    moveLeft = false;
    col++;
   }
  }else if(moveRight){
   v.lefty-=transGap;
   v.righty-=transGap;
   v.topy-=transGap; 
   translate((v.leftx+v.rightx+0.0)/2,(v.lefty+v.righty+0.0)/2,v.h);
   rotateX(radians(a));
   translate(-(v.leftx+v.rightx+0.0)/2,-(v.lefty+v.righty+0.0)/2,-v.h);
   a+=aGap;
   countMove++;
   if(countMove==15){
    countMove = 0;
    a = 0;
    moveRight = false;
    col--;
   }
  }else if(moveTop){
   v.h+=transGap; 
   translate((v.leftx+v.rightx+0.0)/2,(v.lefty+v.righty+0.0)/2,v.h);
   rotateY(-radians(a));
   translate(-(v.leftx+v.rightx+0.0)/2,-(v.lefty+v.righty+0.0)/2,-v.h);
   a+=aGap;
   countMove++;
   if(countMove==15){
    countMove = 0;
    a=0;
    moveTop = false;
   }
  }else if(moveDown){
   v.h-=transGap;
   translate((v.leftx+v.rightx+0.0)/2,(v.lefty+v.righty+0.0)/2,v.h);
   rotateY(radians(a));
   translate(-(v.leftx+v.rightx+0.0)/2,-(v.lefty+v.righty+0.0)/2,-v.h);
   a+=aGap;
   countMove++;
   if(countMove==15){
    countMove = 0;
    a = 0;
    moveDown = false;
   }
  }
  v.drawVessel();
  popMatrix();
  u.drawUFO();
  s.drawSword();
  check();
  if(!check()){  
  gap+=0.01;
  }else{
   gap+=0; 
  }
  translate(-gap,0);
  drawWorld();
  rotateAngel+=2;
  go+=gp;
    if(go==0.16)
    gp = -0.01;
    if(go==0)
    gp = 0.01;
    
    goo+=gpp;
    if(goo==0.16)
    gpp = -0.01;
    if(goo==-0.16)
    gpp = 0.01;
    
  if(!check()){
  if(count%15==0){
  updateWorld();
  }
  count++;
 }
}

void keyPressed() {
  if(key == 'a') {
    if(v.lefty<13*0.15-1.15&&!moveRight&&!moveTop&&!moveDown&&!checkLeft())
    moveLeft = true;
  }else if(key == 'd'){    
    if(v.lefty>-1&&!moveLeft&&!moveTop&&!moveDown&&!checkRight())
    moveRight = true;
  }else if (key == 'w'){
    if(!moveRight&&!moveLeft&&!moveDown)
    moveTop = true;
  }else if(key == 's'){
    if(v.h>(world[row][col].heights+0.15)&&!moveLeft&&!moveTop&&!moveRight)
    moveDown = true;
  }else if(key == ' ') {
    spaceCount++;
    if(spaceCount==2)
    spaceCount = 0;
    if(spaceCount==1){
      perspective = true;
      angleX = 0;
      angleY = 0;
    }else if(spaceCount==0){
      perspective = false;
      angleX = 0;
      angleY = 0;
    }
  }
}
