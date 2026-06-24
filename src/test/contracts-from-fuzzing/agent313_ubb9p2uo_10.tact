contract DefaultsVsInit {
  x: Int = 10;
  y: Bool = false;
  s: String = "default";

  init() {
    self.x = 123;
    self.y = true;
    self.s = "override";
  }
}