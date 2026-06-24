contract OptionalAssignments {
  a: Int?;
  b: Bool?;

  init() {
    self.a = 5;
    self.b = null;
  }
}