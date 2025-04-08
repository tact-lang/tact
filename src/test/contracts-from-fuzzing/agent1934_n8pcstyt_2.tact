struct BigStruct {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: Int;
  f: Bool;
  g: Int?;
  h: Bool?;
  i: Int;
  j: Bool;
}

contract ManyFields {
  s: BigStruct;

  init() {
    self.s = BigStruct{
      a: 1,
      b: false,
      c: null,
      d: true,
      e: 42,
      f: true,
      g: 100,
      h: null,
      i: 55,
      j: false,
    };
  }
}
