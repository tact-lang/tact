contract OverwritePersistent {
  val: Int;

  init() {
    self.val = 1;
    self.val = 2;
    self.val = 3;
  }
}
