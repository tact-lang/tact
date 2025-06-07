struct Mix {
  a: Int as uint32;
  b: Int?;
  c: String?;
  d: Bool?;
  e: Cell?;
  f: Int as int64;
  g: String;
  h: Bool;
}

contract MixedFields {
  state: Mix;

  init() {
    self.state = Mix {
      a: 10,
      b: null,
      c: null,
      d: null,
      e: null,
      f: -500,
      g: "hello",
      h: true
    };
  }
}