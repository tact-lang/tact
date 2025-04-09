struct OptInner {
  name: String?;
  flag: Bool?;
}

contract OptionalStructFields {
  opt: OptInner?;

  init() {
    self.opt = null;
  }
}