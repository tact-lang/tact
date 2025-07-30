struct A {
  x: Int;
}

struct B {
  ay: A;
}

struct C {
  bz: B;
}

struct D {
  cw: C;
}

struct E {
  dv: D;
}

contract UltraDeep {
  state: E;

  init() {
    self.state = E{
      dv: D{
        cw: C{
          bz: B{
            ay: A{ x:45 }
          }
        }
      }
    };
  }
}