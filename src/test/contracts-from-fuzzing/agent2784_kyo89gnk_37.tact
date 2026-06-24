contract StringFields {
  a: String;
  b: String?;

  init() {
    self.a = "abc";
    self.b = null;
  }
}