struct Data { val: Int; }

contract OptStructVar {
  info: Data?;

  init() {
    self.info = null;
  }
}