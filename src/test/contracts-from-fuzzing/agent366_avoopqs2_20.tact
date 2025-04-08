struct S {
  x: Int;
}

struct T {
  s: S;
  y: Int;
}

struct U {
  t: T;
  z: Int;
}

contract RecTest {
  u: U;
  init() {
    self.u = U{
      t: T{
        s: S{
          x: 100
        },
        y: 200
      },
      z: 300
    };
  }
}