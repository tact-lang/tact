struct NestedOpcodes {
  i: Int as int64;
  s: String;
  b: Bool;
}

contract SerializeHints {
  f: NestedOpcodes;

  init() {
    self.f = NestedOpcodes{
      i: 123,
      s: "sss",
      b: false,
    };
  }
}