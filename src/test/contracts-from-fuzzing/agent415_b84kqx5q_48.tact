struct MidOpt {
  foo: Int;
  bar: Bool?;
}

contract OuterOptMid {
  field: MidOpt?;

  init() {
    self.field = null;
  }
}