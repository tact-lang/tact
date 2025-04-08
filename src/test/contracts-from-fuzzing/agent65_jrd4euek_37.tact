struct BasicOpt {
  a: Int?;
}

contract DoubleOptional {
  s: BasicOpt?;
  init() {
    self.s = null;
  }
}