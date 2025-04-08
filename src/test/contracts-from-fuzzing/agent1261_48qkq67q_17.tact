struct SConst {
  a: Int;
  b: String;
}

contract ConstFields {
  const CFA: Int = 5;
  const CFB: String = "hi";
  obj: SConst;

  init() {
    self.obj = SConst{ a: self.CFA, b: self.CFB };
  }
}