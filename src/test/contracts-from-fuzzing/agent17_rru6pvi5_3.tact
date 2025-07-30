struct Simple {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract OptionalMix {
  state: Simple;

  init() {
    self.state = Simple{
      a: 123,
      b: true,
      c: "hi",
      d: null,
      e: false,
      f: null
    };
  }
}