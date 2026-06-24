struct DeepNest {
  inner: Inner;
  flag: Bool;
}

struct Inner {
  val: Int;
  nestedFlag: Bool;
}

contract Test {
  nested: DeepNest;

  init() {
    self.nested = DeepNest{
      inner: Inner{val: 99, nestedFlag: false},
      flag: true
    };
  }
}