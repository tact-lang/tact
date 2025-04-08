contract Defaults2 {
  a: Int = 10;
  b: Bool = false;
  s: String = "hi";

  init() {
    self.a = 20;
    self.b = true;
    self.s = "bye";
  }
}