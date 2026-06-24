contract OptionalFalsy {
  a: Int?;
  b: Bool?;
  init() {
    self.a = null;
    self.b = false; // assigning false to optional bool
  }
}