struct A {
  x: Int;
  y: Bool;
}

struct B {
  k: Int;
  a: A;
}

struct C {
  m: Int;
  n: Bool;
  b: B;
}

struct D {
  c: C;
  z: Int;
}

contract ComplexNested {
  state: D;

  init() {
    self.state = D{
      c: C{
        m: 1,
        n: true,
        b: B{
          k:2,
          a:A{x:3,y:false}
        }
      },
      z: 7
    };
  }
}
