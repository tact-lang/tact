struct A {
  b: B;
}

struct B {
  c: C;
}

struct C {
  d: D;
}

struct D {
  value: Int;
}

contract ABCDContract {
  s: A;

  init() {
    self.s = A{
      b: B{
        c: C{
          d: D{
            value: 999
          }
        }
      }
    };
  }
}