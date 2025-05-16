struct S {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract BigDiverseFields {
  s: S;

  init() {
    self.s = S{
      a: 1,
      b: true,
      c: "abc",
      d: null,
      e: null,
      f: null
    };
  }
}
