contract ConstDefaults {
  const X: Int = 5;
  const Y: Int = 6;
  val: Int = self.X + self.Y;

  init() {
    self.val = 42;
  }
}