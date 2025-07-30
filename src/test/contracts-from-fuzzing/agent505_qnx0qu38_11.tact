contract OptFields {
  x: Int? = null;
  y: String? = null;
  z: Bool? = null;
  w: Int = 1;

  init() {
    self.x = 42;
    self.y = "hi";
    self.z = true;
    self.w = 9;
  }

  receive() {
    self.x = self.x;
  }
}