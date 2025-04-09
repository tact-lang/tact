contract OptionalAndNonOptional {
  x: Int;
  y: Int?;

  init() {
    self.x = 42;
    self.y = null;
  }
}