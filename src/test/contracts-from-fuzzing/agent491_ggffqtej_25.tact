contract SerializeTest {
  x: Int as int64;
  y: Int as uint64;
  z: Int;

  init() {
    self.x = 123;
    self.y = 456;
    self.z = 789;
  }
}
