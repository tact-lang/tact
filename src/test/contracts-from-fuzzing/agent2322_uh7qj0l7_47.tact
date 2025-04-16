contract OptionalsDefaultAndInit {
  x: Int? = null;
  y: Bool? = true;

  init() {
    self.x = 42;
    self.y = false;
  }
}
