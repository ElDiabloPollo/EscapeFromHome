class Enemy {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float r;
  PImage enemy1;
  PImage enemy2;
  PImage enemy3;


  Enemy(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = 20;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    r = 20;
    enemy1 = loadImage("enemy1.png");
    enemy2 = loadImage("enemy2.png");
    enemy3 = loadImage("enemy3.png");
  }


  void move() {
    xpos -= xspeed;
    if (xpos < 0) {
      xpos = width + 50;
    }
  }

  void display() {

   if(xspeed <= 3){
     image(enemy1, xpos, ypos-10, 120 ,100);
   }else if(xspeed <= 4 && xspeed >= 3){ 
     image(enemy2, xpos, ypos-10, 200 ,100 );
   }else if(xspeed >= 4 && xspeed <= 5){ 
     image(enemy1, xpos, ypos-10, 120 ,100 );
   }else if(xspeed >= 6 && xspeed <= 8){ 
     image(enemy2, xpos, ypos-10, 200 ,100 );
   }else{
     image(enemy3, xpos, ypos-10, 120 ,100 );
   }
  }
}
