struct Defaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "abc";
}

contract DefaultsStructTest {
  vt: Defaults;

  init() {
    self.vt = Defaults{};
  }
}