contract TestContract {
  count: Int = 5;
  flag: Bool = false;

  init() {
    self.count = 100;
    self.flag = true;
  }
}