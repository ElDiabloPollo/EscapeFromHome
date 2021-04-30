Project[] project = new Project[3];
Inspiration[] inspo = new Inspiration[10];
Ship s;

float screenChoice = 0 ;
float objectX = random(50, width-50);
float objectY = random(50, height-50);
int ScoreCount = 0;
float Xfirst = random(width,width + 50);
float Yfirst = random(height,height + 50);
float funX = random(0,2);
float funY = random(0,2);
float angleR = random(0.1, 30);
float r1 = (int)random(0,255);
float r2 = (int)random(0,255);
float r3 = (int)random(0,255);

void setup() {
  size(800,600);
  frameRate(60);
  //w = new Walker();
  //for (int i = 0; i < ships.length; i++) {
    //ships[i] = new Ship(0,0,0); 
  //}
  s = new Ship(0,0,0);
  for (int i = 0; i < inspo.length; i++) {
    inspo[i] = new Inspiration(0,0);
  }
    
  for (int i = 0; i < project.length; i++) {
    float Xfirst = random(width,width + 50);
    float Yfirst = random(height,height + 50);
    float funX = random(0,2);
    float funY = random(0,2);
    if(funX < 1){
      Xfirst = random(-50,0);
    }else if(funX >= 1){
      Xfirst = random(width/2, width/2);
    }
    if(funY < 1){
      Yfirst = random(-50,0);
    }else if(funY >= 1){
      Yfirst = random(height/2, height/2);
    }
    project[i] = new Project(Xfirst,Yfirst,0,(int)random(0,1)); 
  }
}



void draw() {
  if (screenChoice == 0) {
    OpenScreen();
  } else if (screenChoice == 1) {
     GameScreen();
  } else if (screenChoice == 2) {
     WinScreen();
  } else if (screenChoice == 3) {
     LoseScreen();
  }
}

boolean intersects(Project a) {
  float distance = dist(s.location.x, s.location.y, a.location.x, a.location.y);
  if (distance < 30) {
    return true;
  }else{
    return false;
  }
}
boolean foodCheck(Project b) {
  float distance = dist(objectX, objectY, b.location.x, b.location.x);
  if (distance < 30) {
    return true;
  }else{
    return false;
  }
}


void OpenScreen() {
  background(0);
  float locationx = width/2;
  float locationy = height/2;
  fill(#AF8C8C);
  text("Thoughtful", 50, 50);
  textSize(15);
  //text("You are the little pink dot.", 50, 200);
  text("You are trying to form an idea.", 50, 220);
  text("However, it can be very difficult collecting your thoughts enough to do so.", 50, 240); 
  text("Distractions fly from all directions and attempt to steal your attention away.", 50, 260);
  text("Move your cursor around to interact with the thoughts.", 50, 280);
  text("Try to maneuver towards the Creative Thought without touching the distractions.", 50, 300);
  text("Collect 8 Creative Thoughts to form your idea!", 50, 320);
  textSize(25);
  text("Click Anywhere to Start!",250, 500);
  if(mousePressed){
    screenChoice = 1;
  }

}

void GameScreen() {
  background(0);
  if(dist(objectX, objectY, s.location.x, s.location.y)< 30){
    ScoreCount = ScoreCount + 1;
    objectX = random(50, width - 50);
    objectY = random(50, height - 50);
    inspo[ScoreCount] = new Inspiration(objectX,objectY);
  }
  s.update();
  s.display();
  for (int i = 0; i < project.length; i++) {
    project[i].update();
    project[i].display();
    if (intersects(project[i])){
      screenChoice = 3;
    }
    if (dist(objectX, objectY, project[i].location.x, project[i].location.y) < 30){
      objectX = random(50, width - 50);
      objectY = random(50, height - 50);
      project[i] = new Project(Xfirst,Yfirst,0,(int)random(-1,2)); 
   }
  }
  
  fill(#FF7EDB);
  noStroke();
  circle(objectX, objectY, 20);
  stroke(#1B9B31);
  textSize(20);
  fill(255);
  text(ScoreCount, width - 100, 50);
  text("Creative Thoughts:", width - 300, 50);
  fill(#FFF40D);
  stroke(#1B9B31, 50);
  circle(mouseX, mouseY, 20);
  noFill();
  if(ScoreCount >= 8){
    screenChoice = 2;
  }
  fill(255);
  line(mouseX,mouseY,s.location.x, s.location.y);
}

void LoseScreen() {
  background(225);
  fill(0);
  textSize(20);
  text("Try again!", width/2 - 50, 50);
  textSize(15);
  text("Remember: The distracting thoughts will seek out your attention,", 50, 480);
  text("move your mouse, and try to drag your focus away so it doesn't get stolen away by them!", 50, 500);
  text("Click Anywhere to Play Again", width/2-100, height/2-50);
  if(mousePressed){
    ScoreCount = 0;
    screenChoice = 0;
    setup();
  }
}
void idea(){
  stroke((int)random(0,255), (int)random(0,255), (int)random(0,255));
  translate(width/2, height/2);
  
  float wave = sin(radians(frameCount));
  float w = wave*map(width,0,height,2500,0);
  
  for (int i = 0; i <500; i++) {
    rotate(angleR);
    stroke(r1,r2,0);
    //line(600, i-w/2, -180, i++);
    line(-300, -i+w, -90, i++);
    stroke(r2,r1,0);
    line(-300, i-w, -90, i++);
    fill(255);
  }
}
void WinScreen() {
  background(0);
  fill(225);
  for(int i = 0; i < inspo.length; i++){
    inspo[i].displaydots();
  }
  for (int i = 0; i < 1; i++){
    if (inspo[i].d > 2000){
      idea();
    }
  }
  fill(255);
  text("You Win!", width/2 - 100, height/2-25);
  text("Your Idea has been Initialized...", width/2 - 100, height/2+25);
  if(mousePressed){
    ScoreCount = 0;
    screenChoice = 0;
    setup();
  }
}
