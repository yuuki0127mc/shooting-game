class Myself{
  color body_color = color(0,110,200);
  color body_color_hit = color(0,0,0);
  PVector myself,velosity;
  int myself_size = 50;
  boolean isShoot = false;
  boolean isShoot2 = false;
  float missile_interval=100;
  float missile_preshoot;
  int my_hp;
  boolean dead = false;  
  
  Myself(float x, float y){
    myself = new PVector(x,y);
    velosity = new PVector(0,0);
    missile_preshoot = millis();
    my_hp = 7;
  }
  
  
  void setVelosity(PVector operation){
    velosity.set(operation);
  }
  void setShoot(boolean b){
    isShoot = b;
  }
  void setShoot2(boolean b){
    isShoot2 = b;
  }
  void update(){
    myself.add(velosity);
    
    hitted();
    if(isShoot){
      if(millis() - missile_preshoot >= missile_interval){
        Missile_Myself.add(new Missile(myself.x,myself.y,0,-4));
      missile_preshoot = millis();
    }
  }
    if(isShoot2){
      if(millis() - missile_preshoot >= missile_interval){
        Missile_Myself.add(new Missile(myself.x,myself.y,0,4));
      missile_preshoot = millis();
    }
  }  
  
  }
  
  
  
  void show(){
    text("My HP",20,40);
    textSize(30);
    fill(body_color);
    if(my_hp >=0){
      text(my_hp,150,40);
      textSize(30);
    }
    
    if(dead == false){
      fill(body_color);
      circle(myself.x,myself.y,myself_size);
    }
    
  }
  
  void setDead(boolean b){
    dead = b;
  }
  
  void hitted(){
    Iterator<Missile> it = Missile_Enemy.missiles.iterator();
    while (it.hasNext()) {
        Missile m = it.next();
        if(PVector.dist(m.p,myself)<50){
        my_hp--;
        //println(my_hp);
        it.remove();
        if(my_hp == 0){
        dead = true;        }
      }
    }
  }
  

}
