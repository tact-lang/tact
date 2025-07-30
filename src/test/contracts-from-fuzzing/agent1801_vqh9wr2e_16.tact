struct Mix {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String;
}

contract MixedFields {
  val: Mix;

  init() {
    self.val = Mix{
      a: 1,
      b: true,
      c: "hello",
      d: null,
      e: false,
      f: "world"
    };
  }
}