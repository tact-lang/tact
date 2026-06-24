struct WrapOpt { inner: Int?; }
contract DirectOpt {
  f: WrapOpt?;
  init() {
    self.f = null;
  }
}