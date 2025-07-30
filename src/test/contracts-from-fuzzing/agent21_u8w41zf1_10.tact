struct Inner {
  a: Int;
  b: Bool;
  c: Int?;
}

contract OptionalInnerFlatOuter {
  innerOpt: Inner?;
  outerBool: Bool;
  outerInt: Int?;

  init() {
    self.innerOpt = null;
    self.outerBool = false;
    self.outerInt = null;
  }

  receive() {}
}