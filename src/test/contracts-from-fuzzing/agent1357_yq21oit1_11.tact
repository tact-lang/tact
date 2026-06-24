contract MixedInit {
  a: Int = 1;
  b: Bool;
  c: String = "hi";
  d: String;

  init() {
    self.b = true;
    self.d = "done";
  }
}