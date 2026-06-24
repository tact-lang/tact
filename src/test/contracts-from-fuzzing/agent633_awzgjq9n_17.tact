contract OptionalAssignedFields {
  i: Int? = 1;
  b: Bool? = true;

  init() {
    self.i = null;
    self.b = false;
  }
}
