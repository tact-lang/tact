contract StringOptComplex {
  a: String? = null;
  b: String? = "hi";

  init() {
    self.a = "hello";
    self.b = null;
  }
}