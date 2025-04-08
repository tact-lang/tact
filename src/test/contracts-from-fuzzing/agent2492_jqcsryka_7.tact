struct A {
  a: Int;
}

struct B {
  b: A;
}

struct C {
  c: B;
}

struct D {
  d: C;
}

struct E {
  e: D;
}

contract DeepChain {
  data: E;

  init() {
    self.data = E{
      e: D{
        d: C{
          c: B{
            b: A{a: 999}
          }
        }
      }
    };
  }
}