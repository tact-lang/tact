struct A { u: Int; }
struct B { v: A; } 
struct C { w: B; }

contract DefaultsDeep {
  rec: C;

  init() {
    self.rec = C{ w: B{ v: A{ u:1 } } };
  }
}
