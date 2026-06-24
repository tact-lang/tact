struct ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String;
  g: Int;
  h: Bool;
}

contract ManyFieldsTest {
  big: ManyFields;

  init() {
    self.big = ManyFields{
      a: 1,
      b: true,
      c: "hello",
      d: null,
      e: null,
      f: "world",
      g: 42,
      h: false,
    };
  }
}