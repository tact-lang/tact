struct NestedMany {
  s1: String;
  s2: String?;
  b1: Bool;
  b2: Bool?;
  i1: Int;
  i2: Int?;
}

contract ComplexNested {
  data: NestedMany;

  init() {
    self.data = NestedMany{
      s1: "s1",
      s2: null,
      b1: true,
      b2: null,
      i1: 123,
      i2: null
    };
  }
}