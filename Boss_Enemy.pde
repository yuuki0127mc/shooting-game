class Boss_Enemy{
  color body_color = color(255,0,0);
  PVector myself,velosity;
  int myself_size = 90;
  boolean isShoot = true,dead = false;
  float missile_interval=1000;
  float missile_preshoot;
  int boss_hp;
  
  Myself boss_enemy;
  Boss_Enemy(float x, float y, Myself e){
    myself = new PVector(x,y);
    velosity = new PVector(1,0);
    missile_preshoot = millis();
    boss_enemy = e;
    boss_hp = 6000;
  }
  
  void update(){
    if((myself.x + velosity.x > width) || (myself.x + velosity.x < 0)){
      velosity.x *= -1;
    }else if((myself.y + velosity.y > height) || (myself.y + velosity.y < 0)){
      velosity.y *= -1;
    }
    /*if(myself.x + velosity.x > width){
      velosity.x = random(-1,0);
      velosity.y = random(0,1);
    }else if(myself.x + velosity.x <= 0){
       velosity.x = random(0,1);
       velosity.y = random(-1,0);
    }
    if(myself.y + velosity.y <0){
      velosity.x = random(-1,0);
      velosity.y = random(0,1);
    }
    else if(myself.y + velosity.y >= height){
      velosity.x= random(0,1);
      velosity.y = random(-1,0);
    }*/
    
    
    
    myself.add(velosity);
    if(isShoot){
      if(millis() - missile_preshoot >= missile_interval){
        
        float dir = PVector.sub(boss_enemy.myself,myself).heading();
        Missile_Enemy.add(new Missile(myself.x,myself.y,cos(dir) + random(0.1),sin(dir)+random(0.1)));
        missile_preshoot = millis();
    }
  }
  }
  void show(){
    text("Boss HP",20,80);
    textSize(30);
    fill(body_color);
    if(boss_hp >=0){
      text(boss_hp,150,80);
      textSize(30);
      fill(body_color);
    }
    fill(body_color);
    circle(myself.x,myself.y,myself_size);
  }
  void setDead(boolean b){
    dead = b;
  }
  
  void hit(PVector p){
    if(PVector.dist(p,myself)<90){
      boss_hp--;
      if(boss_hp == 0){
      dead = true;
      }
    }
  }
  boolean isDead(){
    return myself.x < 0|| myself.x > width || myself.y < 0 || myself.y > height || dead;
  }
}
