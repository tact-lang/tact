struct StringMix {
  a: String;
  b: String?;
  c: String;
  d: String?;
}

contract Test10 {
  data: StringMix;

  init() {
    self.data = StringMix{
      a: "A",
      b: null,
      c: "C",
      d: null,
    };
  }
}
