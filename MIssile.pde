class Missile{
  color body_color = color(150, 150, 150);
  PVector p,v;
  float head;
  Missile(float px,float py,float vx,float vy){
   p = new PVector(px,py);
   v = new PVector(vx,vy);
   head = v.heading()+PI/2;
   
  }
  void update(){
    p.add(v);
  }
  void show(){
    fill(body_color);
    noStroke();
    pushMatrix();
    translate(p.x,p.y);
    rotate(head);
    ellipseMode(CENTER);
    ellipse(0, 0, 20/4, 20);
    popMatrix();
   //circle(p.x,p.y,10);
  }
  boolean isDead(){
    return p.x < 0|| p.x > width || p.y < 0 || p.y > height;
  }
}
