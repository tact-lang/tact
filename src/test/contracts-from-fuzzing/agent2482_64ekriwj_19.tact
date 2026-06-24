contract Defaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "default";

  init() {
    self.b = true;
  }
}