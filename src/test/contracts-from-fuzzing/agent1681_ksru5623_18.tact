contract DefaultsAndUninit {
  x: Int = 1;
  y: Bool;
  z: String = "hello";

  init() {
    self.y = true;
  }
}