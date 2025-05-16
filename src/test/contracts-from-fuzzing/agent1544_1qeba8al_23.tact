struct A {
  val: Int?;
}

struct B {
  a: A?;
}

contract DeepOptionalChain {
  field: B;

  init() {
    self.field = B {
      a: null
    };
  }
}
