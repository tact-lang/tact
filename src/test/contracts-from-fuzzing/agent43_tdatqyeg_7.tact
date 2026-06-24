struct DefaultVals {
  a: Int = 5;
  b: Bool = true;
  c: String = "hello";
}

contract HasDefaults {
  val: DefaultVals;

  init() {
    self.val = DefaultVals{};
  }
}