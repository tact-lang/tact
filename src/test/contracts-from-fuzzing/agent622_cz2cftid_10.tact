struct SDeep {
  x: Int = 1;
  y: Bool = false;
}

contract NestedOpt {
  rec: SDeep?;
  init() {
    self.rec = null;
  }
}