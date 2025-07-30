struct Mix {
  a: Int;
  b: Bool;
  c: String?;
  d: Address?;
}

contract Test {
  data: Mix;

  init() {
    self.data = Mix{
      a: 1,
      b: true,
      c: null,
      d: null,
    };
  }
}
