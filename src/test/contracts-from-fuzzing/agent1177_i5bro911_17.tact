contract StorageLayoutOrder {
  x: Int as uint8;
  y: Int as uint256;
  z: Int;

  init() {
    self.x = 1;
    self.y = 2;
    self.z = 3;
  }
}
