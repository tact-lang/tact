struct Mix {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
}

contract TestMix {
  v: Mix;

  init() {
    self.v = Mix{
      a: 1,
      b: false,
      c: null,
      d: null,
    };
  }
}