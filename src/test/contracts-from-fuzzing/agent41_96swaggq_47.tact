struct FlatBoolIntStr {
  a: Int;
  b: Bool;
  c: String;
}

contract FlatMix {
  f: FlatBoolIntStr;

  init() {
    self.f = FlatBoolIntStr{
      a: 3,
      b: false,
      c: "flat"
    };
  }
}
