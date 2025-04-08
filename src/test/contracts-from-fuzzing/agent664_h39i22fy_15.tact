// very long struct with many diverse fields and optionals

struct Mix {
  a: Int;
  b: Bool?;
  c: String;
  d: Bool;
  e: Int?;
  f: String?;
  g: Int;
  h: Bool;
  i: String;
  j: Bool?;
  k: Int?;
  l: String?;
}

contract Test {
  m: Mix;

  init() {
    self.m = Mix{
      a: 5,
      b: null,
      c: "hello",
      d: true,
      e: null,
      f: "world",
      g: 10,
      h: false,
      i: "tact",
      j: null,
      k: 0,
      l: null,
    };
  }
}