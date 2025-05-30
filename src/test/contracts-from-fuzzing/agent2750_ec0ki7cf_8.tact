struct A {
  val: Int?;
}

struct B {
  opt_a: A?;
  str: String;
}

contract NestedOption {
  b_field: B;
  init() {
    self.b_field = B {
      opt_a: null,
      str: "test"
    };
  }
}
