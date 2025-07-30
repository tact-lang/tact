contract DefaultsMissing {
  x: Int;
  y: Bool = false;
  z: String;

  init() {
    self.x = 5;
    self.z = "hi";
  }
}