contract ChainAssignments {
  x: Int;
  y: Int;
  z: Int;

  init() {
    self.x = 1;
    self.y = self.x + 10;
    self.z = self.y + 20;
  }
}