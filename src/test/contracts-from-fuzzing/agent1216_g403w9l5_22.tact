contract DefaultsTest {
  a: Int = 3;
  b: Bool = true;
  s: String = "abc";

  init() {
    self.a = 10;
    self.b = false;
    self.s = "zzz";
  }
}