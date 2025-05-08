struct S {
  a: Int;
  b: Bool;
  c: Int?;
  d: String;
}

contract DefaultsOpt {
  s: S;

  init() {
    self.s = S{
      a: 12,
      b: false,
      c: null,
      d: "abc"
    };
  }
}