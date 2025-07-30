contract InitDefaults {
  flag: Bool = true;
  count: Int = 5;

  init() {
    self.flag = false;
    self.count = 10;
  }
}