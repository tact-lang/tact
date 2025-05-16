struct IntBoolStr {
  i: Int;
  b: Bool;
  s: String;
}

contract MixedTypesTest {
  field: IntBoolStr;

  init() {
    self.field = IntBoolStr{
      i: 99,
      b: false,
      s: "hello",
    };
  }
}