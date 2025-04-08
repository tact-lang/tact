contract NullableBool {
  flag: Bool?;

  init() {
    self.flag = null;
  }
}