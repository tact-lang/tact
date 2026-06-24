struct StructWithStrings {
  s1: String;
  s2: String?;
}

contract TestStructWithStrings {
  data: StructWithStrings;

  init() {
    self.data = StructWithStrings{
      s1: "hello",
      s2: null,
    };
  }
}
