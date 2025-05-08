struct Defaults {
  a: Int as uint8 = 1;
  b: Int?;
  c: Bool = false;
  d: String = "foo";
}

contract Test {
  dd: Defaults;

  init() {
    self.dd = Defaults{b: null};
  }
}