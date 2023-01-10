import java.util.Iterator;
static class Missile_Myself{
  static ArrayList<Missile> missiles = new ArrayList<Missile>();
  static void add(Missile m){
    missiles.add(m);
  }
  static void run(){
    Iterator<Missile> it = missiles.iterator();
    while (it.hasNext()) {
      Missile p = it.next();
      
      if(p.isDead()){
        it.remove();
      }
      
      p.update();
      p.show();
    }
  }
}
