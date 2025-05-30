contract MixDefaults {
  a: Int = 1;
  b: Bool;
  c: Int? = null;
  d: String;

  init() {
    self.b = true;
    self.d = "q";
  }
}