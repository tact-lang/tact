contract DefaultValueTest {
  a: Int = 1;
  b: Bool = true;
  c: String = "default";

  init() {
    self.b = false;
    self.c = "changed";
  }
}