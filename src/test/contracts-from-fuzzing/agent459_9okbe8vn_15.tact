struct Defaulted {
  a: Int = 1;
  b: Bool = true;
  c: String = "abc";
}

contract DefaultFields {
  f: Defaulted;

  init() {
    self.f = Defaulted{};
  }
}