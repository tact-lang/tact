contract StringDefaults {
  a: String = "";
  b: String = "nonempty";

  init() {
    self.a = "hello";
    self.b = "world";
  }
}