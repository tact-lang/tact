struct DefaultVals {
  a: Int = 7;
  b: Bool = false;
  c: String = "hello";
}

contract Defaults {
  d: DefaultVals;

  init() {
    self.d = DefaultVals{};
  }
}