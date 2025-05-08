// Test default null on optional Cell and Slice fields in persistent storage
contract NullDefaults {
  x: Cell? = null;
  y: Slice? = null;

  init() {
    self.x = null;
    self.y = null;
  }
}