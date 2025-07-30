contract Defaults {
  x: Int = 10;
  y: Bool = true;
  z: String = "hello";

  init() {
    self.x = 5;
    self.y = false;
    self.z = "world";
  }
}
