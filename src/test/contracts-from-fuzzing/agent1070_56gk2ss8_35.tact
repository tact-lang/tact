contract DefaultOverride {
  val: Int = 123;

  init() {
    self.val = 456;
  }
}