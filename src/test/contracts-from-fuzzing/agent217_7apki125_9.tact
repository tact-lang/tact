struct DeepOpt {
  a: Int?;
}

struct MidOpt {
  b: DeepOpt?;
}

contract NestedOptionals {
  foo: MidOpt?;

  init() {
    self.foo = null;
  }
}