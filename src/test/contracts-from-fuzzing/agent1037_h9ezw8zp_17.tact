contract OptStrNonNullDefault {
  s: String? = "hello";

  init() {
    self.s = "hello";
  }
}