contract NegativeUint {
  x: Int as uint8;

  init() {
    self.x = -1; // invalid runtime but compile-time should pass
  }
}