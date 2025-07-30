struct Nested {
  c: Int;
  d: Int?;
  e: String;
}

struct Complex {
  a: Int;
  b: Bool;
  f: String;
  g: Nested;
  h: Bool?;
  i: String?;
}

contract Test {
  info: Complex;

  init() {
    self.info = Complex{
      a: 123,
      b: false,
      f: "foo",
      g: Nested{c: 7, d: null, e: "bar"},
      h: true,
      i: null,
    };
  }
}