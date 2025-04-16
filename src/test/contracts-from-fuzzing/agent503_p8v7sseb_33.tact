contract LargeNumDefault {
  big: Int = 1000000000000000000000000000000000;

  init() {
    self.big = 42;
  }
}
