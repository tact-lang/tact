contract InitDefaultsClash {
  value: Int = 1;

  init() {
    self.value = 2;
  }
}