import java.util.Iterator;
static class Boss_Enemy_List{
  static ArrayList<Boss_Enemy> boss_enemy = new ArrayList<Boss_Enemy>();
  static void add(Boss_Enemy m){
    boss_enemy.add(m);
  }
  static void run(){
    Iterator<Boss_Enemy> it = boss_enemy.iterator();
    while (it.hasNext()) {
      Boss_Enemy e = it.next();
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
