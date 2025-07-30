struct ManyTypes {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: String;
  f: Bool;
}

contract FieldsMix {
  f1: ManyTypes;
  init() {
    self.f1 = ManyTypes{
      a: 123,
      b: true,
      c: "test",
      d: null,
      e: "end",
      f: false
    };
  }
}