contract AssignedDefaultOpts {
  x: Int? = null;
  y: String? = null;
  z: Bool? = null;

  init() {
    self.x = null;
    self.y = "abc";
    self.z = true;
  }
}