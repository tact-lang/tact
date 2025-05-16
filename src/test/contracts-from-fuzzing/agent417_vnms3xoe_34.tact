struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }
contract ABC {
 v: C;
 init() {
  self.v = C{ z: B{ y: A{ x:99 }}};
 }
}