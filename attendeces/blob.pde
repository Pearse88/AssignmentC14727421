class Blob{
 float x;
 float y;
 float startW = 50;
 float startH = 50;
 float w;
 float h;
 color c;
 String n;
 int id;
 int p;
 
 public Blob( float w, float h, color c, String n, int id, int p) {
 
  
  this.w = w;
  this.h = h;
  this.c = c;
  this.n = n;
  this.id = id;
  this.p = p;
 
    if(id == 0){
    x=290;
    y=214;
  }
  if(id == 1){
    x=470;
    y=260;
  }
  if(id == 2){
    x=120;
    y=230;
  }
  if(id == 3){
    x=200;
    y=500;
  }
  if(id == 4){
    x=350;
    y=420;
  }
  if(id == 5){
    x=540;
    y=500;
  }
 }
 void check(){
   float disX = x - mouseX;
   float disY = y - mouseY;
   if (sqrt(sq(disX) + sq(disY)) < 50/2){
    startW = w;
    startH = h;
    txt = true;
   }else if(mousePressed){
     startW = w;
    startH = h;
    txt = false;
   } else {
     startW = 20;
     startH = 30;
     txt = false;
   }
   
 }
 void info(){
   if(txt == true){
   textFont(f, 20);
   fill(0,200,0);
   text(n, 130, 590);
   text(p,210, 590);
   }else {
     textFont(f, 20);
   fill(0);
     text("Hover over the circles to reveal the fanbase of the continents.",630,30); 
     text("Press the mousebutton to compare the  sizes.", 630, 50);
   }
 }
 void render() {
  noStroke();
 fill(c); 
 ellipse(x,y,startW,startH);
 }
}