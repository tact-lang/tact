struct StructWithStrings {
  a: String;
  b: String?;
  c: String;
  d: String?;
}

contract StringsMix {
  f: StructWithStrings;

  init() {
    self.f = StructWithStrings{
      a: "A",
      b: null,
      c: "C",
      d: null,
    };
  }
}