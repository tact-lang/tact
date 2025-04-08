struct Mix {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract MixFields {
  storage: Mix;

  init() {
    self.storage = Mix{
      a: 7,
      b: true,
      c: "Hello",
      d: null,
      e: null,
      f: null,
    };
  }
}