struct ManyFields {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Int;
  h: Bool;
  i: String;
  j: Int?;
  k: Bool?;
}

contract ManyStructFields {
  data: ManyFields;

  init() {
    self.data = ManyFields{
      a: 1,
      b: true,
      c: "hello",
      d: null,
      e: null,
      f: null,
      g: 2,
      h: false,
      i: "world",
      j: null,
      k: null,
    };
  }
}