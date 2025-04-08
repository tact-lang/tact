struct A {
  x: Int;
}

struct B {
  a: A;
}

struct C {
  b: B?;
}

struct D {
  c: C;
}

contract NullableChains {
  val: D;
  init() {
    self.val = D{
      c: C{
        b: null,
      },
    };
  }
}