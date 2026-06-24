struct A {
  x: Int;
}

struct B {
  y: Int;
  a: A;
}

struct C {
  z: Int;
  b: B;
}

contract DeepChain {
  state: C;

  init() {
    self.state = C{
      z: 3,
      b: B{
        y: 2,
        a: A{
          x: 1
        }
      }
    };
  }
}