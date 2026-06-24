contract MissingSomeDefaults {
  a: Int = 1;
  b: Bool;
  c: String;

  init() {
    self.b = true;
    self.c = "hi";
  }
}
