struct B {
  bx: Int;
  by: String;
}

struct A {
  ax: Int;
  b1: B;
  b2: B;
  optB: B?;
}

contract NestedStructs {
  data: A;
  init() {
    self.data = A{
      ax: 1,
      b1: B{ bx:2, by:"x" },
      b2: B{ bx:3, by:"y" },
      optB: null
    };
  }
}