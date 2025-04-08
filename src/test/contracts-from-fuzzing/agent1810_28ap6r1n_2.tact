struct ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String;
  g: Bool;
  h: Int;
  i: Bool?;
  j: String;
}

contract ManyFieldsContract {
  m: ManyFields;

  init() {
    self.m = ManyFields{
      a: 1,
      b: false,
      c: "c",
      d: null,
      e: null,
      f: "f",
      g: true,
      h: 8,
      i: null,
      j: "j"
    };
  }
}