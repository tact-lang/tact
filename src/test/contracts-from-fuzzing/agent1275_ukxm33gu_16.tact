struct Defaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "abc";
}

contract StructDefaultFields {
  xf: Defaults;

  init() {
    self.xf = Defaults{};
  }
}