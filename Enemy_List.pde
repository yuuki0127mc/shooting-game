import java.util.Iterator;
static class Enemy_List{
  static ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  static void add(Enemy m){
    enemies.add(m);
  }
  static void run(){
    Iterator<Enemy> it = enemies.iterator();
    while (it.hasNext()) {
      Enemy e = it.next();
      Iterator<Missile> it2 = Missile_Myself.missiles.iterator();
       if(e.isDead()){
         it.remove();
       }else{
      while(it2.hasNext()){
        Missile missile = it2.next();
        e.hit(missile.p);
        if(e.isDead()){
          it2.remove();
          it.remove();
          break;
        }
      }
       }
     
      e.update();
      e.show();
    }
  }
}
