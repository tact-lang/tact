contract MultiOptionals {
  x: Int?; y: Int?; z: Int?;
  a: Bool?; b: Bool?;
  s: String?; t: String?;
  init() {
    self.x = null; self.y=2; self.z=3;
    self.a = true; self.b = null;
    self.s = null; self.t = "hi";
  }
}
