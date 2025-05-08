struct StructWithStrings {
  foo: String;
  bar: String;
  baz: String;
}

contract TestContract {
  s: StructWithStrings;

  init() {
    self.s = StructWithStrings{
      foo: "one",
      bar: "two",
      baz: "three"
    };
  }
}