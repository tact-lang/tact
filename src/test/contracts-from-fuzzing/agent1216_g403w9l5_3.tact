struct BigStruct {
  a: Int;
  b: String;
  c: Bool;
  d: Int?;
  e: String;
  f: Bool?;
  g: Int;
  h: String;
}

contract ManyFieldsTest {
  s: BigStruct;

  init() {
    self.s = BigStruct{
      a: 10,
      b: "B",
      c: true,
      d: 20,
      e: "E",
      f: false,
      g: 30,
      h: "H",
    };
  }
}