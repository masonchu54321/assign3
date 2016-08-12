//object pic
PImage hpImage, fighterImage, enemyImage, treasureImage;

//background pic
PImage bg1Image, bg2Image;

//position var
float x_fighter, y_fighter, x_hpRect,x_treasure, y_treasure, x_enemy, y_enemy, x_bg1, x_bg2;

//pressed
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

//
int speed_fighter = 4;
final int full_hp = 206;
final int count_1 = 5;
float x;
float spacingX_1 = 70; 

//pic properties
final int height_trease = 41, width_trease = 41;
final int height_fighter = 51, width_fighter = 51;
final int height_enemy = 61, width_enemy = 61;

void setup () {
  size(640,480) ;
  
  //input pic
  hpImage = loadImage("img/hp.png");
  fighterImage = loadImage("img/fighter.png");
  enemyImage = loadImage("img/enemy.png");
  treasureImage = loadImage("img/treasure.png");
  bg1Image = loadImage("img/bg1.png");
  bg2Image = loadImage("img/bg2.png");

  //position var
  x_fighter = 590;
  y_fighter = 243;
  x_hpRect = 46;
  x_treasure = floor(random(150,580));
  y_treasure = floor(random(35,435));
  //x_enemy =0;
  //y_enemy = 300;//floor(random(35,417));
  rectMode(CORNERS);
  x_bg1 = 0;
  
}

void draw() {

  //background
  image(bg1Image,x_bg1 % (width*2) -width,0);
  image(bg2Image,(x_bg1+width) % (width*2) -width,0);
  x_bg1 += 1;
          
  //hp
  rect(5,3,full_hp,25);
  fill(255,0,0);
  image(hpImage,0,0);
          
  //fighter
  image(fighterImage, x_fighter, y_fighter);
  image(treasureImage, x_treasure, y_treasure);
  
  //enemies
  for (int i=0; i < count_1; i++){
    x_enemy += 2;
    x_enemy = i*spacingX_1;
    y_enemy = 250;
    image(enemyImage,x_enemy,y_enemy);
  }
  
    image(enemyImage,x_enemy,y_enemy);
  if(x_enemy >= width) {
    x_enemy = 0;
    y_enemy = floor(random(35,417));
  }
  //fighter control
  if(upPressed) {y_fighter -= speed_fighter;}
  if(downPressed) {y_fighter += speed_fighter;}
  if(rightPressed) {x_fighter += speed_fighter;}
  if(leftPressed) {x_fighter -= speed_fighter;}
          
  // fighter boundary
  if(y_fighter <= 2) {
    y_fighter = 2;
  }
  if(y_fighter >= height-52) {
    y_fighter = height-52;
  }
  if(x_fighter <= 2) {
    x_fighter = 2;
  }
  if(x_fighter >= width-52) {
    x_fighter = width-52;
  }
}
void keyPressed(){
  if(key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
    }
  }
}
void keyReleased(){
  if(key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
    }
  }

}
