contract SerializeOverrideTest {
  x: Int as uint32;
  y: Int as int64;
  z: Int as coins;

  init() {
    self.x = 10;
    self.y = -20;
    self.z = ton("1");
  }
}
