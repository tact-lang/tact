struct Defaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "s";
}
contract Defaulted {
  f: Defaults;

  init() {
    self.f = Defaults{};
  }
}