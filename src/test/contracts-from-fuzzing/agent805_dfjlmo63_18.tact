contract OptionalDefaultConflict {
  x: Int? = null;
  y: Int?;

  init() {
    self.y = null;
  }
}
