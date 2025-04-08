contract DefaultAbsentVar {
  persistentVal: Int;

  init() {
    self.persistentVal = 99;
  }

  receive() {
    let _ = self.persistentVal;
  }
}
