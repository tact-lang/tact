struct NestedOpt {
  innerOpt: Bool?;
}

contract ComplexOpt {
  testOpt: NestedOpt?;

  init() {
    self.testOpt = NestedOpt{ innerOpt: true };
  }
}
