boolean isLeft,isUp,isRight,isDown = false;
Myself myself,dead;
Enemy enemy;
String scene = "start";


void setup(){
  size(1000,600);
  textSize(50);
  fill(250, 186, 122);
  smooth();
  myself = new Myself(width/2,height/2);
      Enemy_List.add(new Enemy(width/4,150,myself));
      Enemy_List.add(new Enemy(2*width/4,150,myself));
      Enemy_List.add(new Enemy(3*width/4,150,myself));
      Boss_Enemy_List.add(new Boss_Enemy(width/2,50,myself));
}
void draw(){
  common();
  if(scene == "start"){
    start_scene();
  }
  else if(scene == "game"){
    game_scene();
  }
  if(Enemy_List.enemies.size() == 0){
    clear_scene();
  }
  /*if( <= 0){
    gameover_scene();
  }*/
  
}



void common(){
  background(255);
}
void start_scene(){
  fill(0);
  background(212, 250, 252);
  text("Start",width/5,height/2);
  text("Please Click",width/5,height/2+60);
}

void game_scene(){
  background(212, 250, 252);
  myself.update();
  myself.show();
  Enemy_List.run();
  Boss_Enemy_List.run();
  Missile_Myself.run();
  Missile_Enemy.run();
  
}
void clear_scene(){
  fill(0);
  text("Clear",width/5,height/2);
}
void gameover_scene(){
  fill(0);
  text("GameOver",width/5,height/2);
}

void mousePressed(){
  if(scene == "start")scene = "game";
}

void keyPressed() {
  int h=0;
  int v=0;
  if(key == CODED){
  if(keyCode == LEFT)isLeft = true;
  if(keyCode == UP)isUp = true;
  if(keyCode == RIGHT)isRight = true;
  if(keyCode == DOWN)isDown = true;
  }else if(key == ' ')myself.setShoot(true);
  else if(key == 'B' || key == 'b')myself.setShoot2(true);
  if(isLeft)h-=2;
  if(isUp)v-=2;
  if(isRight)h+=2;
  if(isDown)v+=2;
  myself.setVelosity(new PVector(h,v));
  
}
void keyReleased() {
  int h=0;
  int v=0;
  if(key == CODED){
  if(keyCode == LEFT)isLeft = false;
  if(keyCode == UP)isUp = false;
  if(keyCode == RIGHT)isRight = false;
  if(keyCode == DOWN)isDown = false;
  }else if(key == ' ')myself.setShoot(false);
  else if(key == 'B' || key == 'b')myself.setShoot2(false);
  if(isLeft)h--;
  if(isUp)v--;
  if(isRight)h++;
  if(isDown)v++;
  myself.setVelosity(new PVector(h,v));

}
