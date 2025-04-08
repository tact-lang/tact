struct WrapOpt {
  x: Int?; y: Bool?; z: String?;
}

contract OptStructWrap {
  state: WrapOpt?;

  init() {
    self.state = null;
  }
}