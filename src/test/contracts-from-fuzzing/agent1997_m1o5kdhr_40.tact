struct Child {
  b: Bool;
  x: Int as uint7;
}

contract OptNestedAssigned {
  childVal: Child?;

  init() {
    self.childVal = Child{
      b: true,
      x: 77
    };
  }
}
