struct Mix {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract MixedPersistent {
  mix: Mix;

  init() {
    self.mix = Mix{
      a: 1,
      b: true,
      c: "str",
      d: null,
      e: false,
      f: null
    };
  }
}