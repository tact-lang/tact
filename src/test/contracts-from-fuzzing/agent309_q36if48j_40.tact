struct OptWrap {
  x: Int;
}

contract OptWrapHolder {
  f: OptWrap?;

  init() {
    self.f = null;
  }
}