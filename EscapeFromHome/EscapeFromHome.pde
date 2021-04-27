Enemy[] anEnemy; 
ArrayList<Platform> p;
boolean iscolliding = false;
PVector pos;
PVector vel;
float moving = 0;
float walk = 5;
int difficulty = 1;
color col = 10;
float rad = 20;
float m = 500;
int score;
int gameScreen = 0;
PImage img;
PImage me;
PImage back1;
PImage back2;
PImage back3;
PImage endscreen;

void setup() {
  size(800, 600);
  smooth();
  rectMode(CENTER);
  img = loadImage("startscreen.png");
  me = loadImage("Character.png");
  back1 = loadImage("Background1.png");
  back2 = loadImage("Background2.png");
  back3 = loadImage("Background3.png");
  endscreen = loadImage("endscreen.png");
  difficulty = difficulty + 1;
  p = new ArrayList<Platform>();
  anEnemy = new Enemy[difficulty];
  float y = height/2;
  float ory = y;
  for(int i = 0; i < width/100; i++) {
    p.add(new Platform(i*100, y));
    y += random(-100, 100);
  }
  pos = new PVector(20, ory);
  vel = new PVector();
  for (int i = 0; i < anEnemy.length; i++) {
    anEnemy[i] = new Enemy(color(255, 0, random(0,20)), random(800, 1000), random(0,400), random(difficulty, 1 + difficulty));
  }
}

boolean intersects(Enemy d) {
  float distance = dist(pos.x, pos.y, d.xpos, d.ypos);
  if (distance < rad + d.r) {
    return true;
  } else {
    return false;
  }
}

void draw() {
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
    difficulty = 1;
  }
}

void initScreen() {
  background(200);
  fill(#1D26B4);
  rect(width/2, height/2, 100, 100);
  image(img, 0, 0, width, height);
  if(key == 'a'){
    fill(255);
    rect(width/2, height/2, 300, 300);
    fill(100);
    textSize(18);
    text("Use 'a' and 'd' to move", width/2-145, height/2-100);
    text("Use 'space' to jump", width/2-145, height/2-80);
    text("Dodge the dangerous robots", width/2-145, height/2-60);
    text("Try to make it to the next screen", width/2-145, height/2-40);
    text("Good Luck", width/2-145, height/2);
  }
  if(key == 'b'){
    image(img, 0, 0, width, height);
  }
}
void gameScreen() {
  background(51);
  if(difficulty == 4 || difficulty == 6){
    image(back1, 0, 0, width, height);
  }else if( difficulty == 3 || difficulty == 7){
    image(back2, 0, 0, width, height);
  }else{
    image(back1, 0, 0, width, height);
  }
  iscolliding = false;
  for(Platform i: p) {
    i.show();
    if(i.collide(pos)) {
      iscolliding = true;
      pos.y = i.pos.y;
    }
  }
  if(pos.y > height) {
    gameScreen = 2;
  }
  if(pos.x > width) {
    gameScreen = 1;
    setup();
    score = difficulty;
  }
  image(me, pos.x-40, pos.y-40, 120, 120);
  if(!iscolliding) {
    vel.y += 0.2;
  }
  pos.add(vel);
  pos.x += moving;
  vel.mult(0.9);
  for (int i = 0; i < difficulty; i++) {
    anEnemy[i].move();
    anEnemy[i].display();
    if (intersects(anEnemy[i])){
      gameScreen = 2;
      score = difficulty;
    }
  }
}

void gameOverScreen() {
  background(0);
  image(endscreen, 0, 0, width, height);
  fill(0);
  textSize(26);
  text(score , width/2+200, height/2);
}

void keyPressed() {
  if(key == 'a') {
    moving = -walk;
  }
  if(key == 'd') {
    moving = walk;
  }
  if(key == ' ') {
    if(iscolliding) {
      vel.y -= 20;
    }
  }
}
void keyReleased() {
  if(key == 'a') {
     moving = 0;
  }
  if(key == 'd') {
     moving = 0;
  }
}

public void mousePressed() {
  if (gameScreen==0) {
    if(mouseX>=700){
      startGame();
    }
  }
  if (gameScreen==2) {
    setup();
    startGame();
  }
}

void startGame() {
  gameScreen=1;
}
