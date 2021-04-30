class Project{
  PVector location;
  PVector velocity;
  PVector noise;
  float topspeed;
  float Xind;
  float Yind;
  float Size;
  float tx,ty, step_x, step_y;
  float type;
  
  Project(float tempXind, float tempYind, float tempSize, float typeH) {
    topspeed = 5;
    Xind = tempXind;
    Yind = tempYind;
    Size = tempSize;
    location = new PVector(Xind,Yind);
    velocity = new PVector(-10,-10);
    tx = (int) random(0,10000);
    ty = (int) random(0,10000);
    type = typeH;
  }

  void update() {
    step_x = map(noise(tx), 0, 1, -8, 8);
    step_y = map(noise(ty), 0, 1, -8, 8);

    location.x += step_x;
    location.y += step_y;
    tx += 0.01;
    ty += 0.01;
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse,location);
    acceleration.normalize();
    acceleration.mult(0.05);
    velocity.add(acceleration);
    velocity.limit(topspeed);   
    location.add(velocity);
  }
  void display() {
    stroke(#1B5B9B);
    strokeWeight(2);
    noFill();
    ellipse(location.x,location.y,30,30);
    if(Size == 1){
      fill(#F8FF31);
      ellipse(location.x,location.y,10,10);
    }else if(Size == 1){
      ellipse(location.x,location.y,10,10);
    }else if(Size == 1){
      ellipse(location.x,location.y,10,10);
    }
  }
  void step() {
    step_x = map(noise(tx), 0, 1, -8, 8);
    step_y = map(noise(ty), 0, 1, -8, 8);

    location.x += step_x;
    location.y -= step_y;
    tx += 0.01;
    ty += 0.01;
    
    location.x = constrain(location.x,0,width);
    location.y = constrain(location.y,0,height);
  }
}
