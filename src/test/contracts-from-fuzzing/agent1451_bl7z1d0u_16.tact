struct OptStrings {
  a: String?;
  b: String?;
  c: String?;
}

contract ManyOptStrings {
  opts: OptStrings;

  init() {
    self.opts = OptStrings{
      a: null,
      b: "foo",
      c: null
    };
  }
}
