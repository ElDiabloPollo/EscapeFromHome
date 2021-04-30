class Inspiration{
  float Ix;
  float Iy;
  float angleR;
  float r1 = (int)random(0,255);
  float r2 = (int)random(0,255);
  float r3 = (int)random(0,255);
  float d = 50;

  
  Inspiration(float tempIx, float tempIy){
    Ix = tempIx;
    Iy = tempIy;
    angleR = random(0.1, 30);
  }
  void displaydots(){
    fill(0);
    d = d + 5;
    ellipse(Ix,Iy, d, d);
  }
  void displaybar(){
    fill(0);
    ellipse(20,height-50, 90, 580);
  }
}
