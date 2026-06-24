// Optional of optional struct (single option layer allowed)
struct Inner {
  z: Int;
}
contract DoubleOpt {
  opt: Inner?;
  init() {
    self.opt = null;
  }
}
