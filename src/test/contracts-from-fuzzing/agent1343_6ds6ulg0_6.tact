struct A {
  val: Int;
}

struct B {
  a: A;
}

struct C {
  b: B;
}

struct D {
  c: C;
}

contract DeepChain {
  field: D;

  init() {
    self.field = D{
      c: C{
        b: B{
          a: A{ val: 123 }
        }
      }
    };
  }
}
