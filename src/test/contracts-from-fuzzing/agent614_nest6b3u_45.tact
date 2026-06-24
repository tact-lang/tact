contract ConflictingInits {
  a: Int;
  b: Int = 7;

  init() {
    self.a = 5;
    self.b = 10;
  }
}