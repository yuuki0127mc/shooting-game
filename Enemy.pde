class Enemy{
  color body_color = color(204,153,0);
  PVector myself,velosity;
  int myself_size = 50;
  boolean isShoot = true,dead = false;
  float missile_interval=1000;
  float missile_preshoot;
  int enemy_hp;
  
  Myself enemy;
  Enemy(float x, float y, Myself e){
    myself = new PVector(x,y);
    velosity = new PVector(1,0);
    missile_preshoot = millis();
    enemy = e;
    enemy_hp = 200;
  }
  
  void update(){
    if(myself.x + velosity.x > width){
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
    }
    
    
    
    myself.add(velosity);
    if(isShoot){
      if(millis() - missile_preshoot >= missile_interval){
        
        float dir = PVector.sub(enemy.myself,myself).heading();
        Missile_Enemy.add(new Missile(myself.x,myself.y,cos(dir) + random(0.1),sin(dir)+random(0.1)));
        missile_preshoot = millis();
    }
  }
  }
  void show(){
    fill(body_color);
    circle(myself.x,myself.y,myself_size);
    
  }
  void setDead(boolean b){
    dead = b;
  }
  
  void hit(PVector p){
    if(PVector.dist(p,myself)<50){
      enemy_hp--;
      if(enemy_hp == 0){
      dead = true;
      }
    }
  }
  boolean isDead(){
    return myself.x < 0|| myself.x > width || myself.y < 0 || myself.y > height || dead;
  }
}
