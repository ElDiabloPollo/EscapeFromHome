class Ship {

  PVector location;
  PVector velocity;
  float topspeed;
  float Xind;
  float Yind;
  float Size;
  
  Ship(float tempXind, float tempYind, float tempSize) {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    topspeed = 10;
    Xind = tempXind;
    Yind = tempYind;
    Size = tempSize;
  }

  void update() {
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse,location);
    acceleration.normalize();
    acceleration.mult(0.1);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  void display() {
    stroke(#FFE131);
    strokeWeight(2);
    noFill();
    ellipse(location.x,location.y,48,48);
    triangle(location.x - 5, location.y - 15, location.x + 15, location.y + 5, location.x + 25, location.y - 25);
    triangle(location.x + 3 , location.y + 35, location.x + 15, location.y + 5, location.x - 15, location.y + 15);
    //triangle(location.x - 10, location.y + 30, location.x + 10, location.y + 10, location.x - 20, location.y + 20);
    triangle(location.x - 5, location.y - 15, location.x - 35, location.y - 7 , location.x - 15, location.y + 15);
  }
}
