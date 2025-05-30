struct InnerStringOpt {
  s: String?;
}

contract OptStructWrap {
  x: InnerStringOpt?;

  init() {
    self.x = null;
  }
}