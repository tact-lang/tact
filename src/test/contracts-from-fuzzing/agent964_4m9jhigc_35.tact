struct S {
  a: Int;
  b: Bool;
  c: String;
}

contract PartialInit {
  f: S;

  init() {
    self.f = S{
      a: 1,
      b: false,
      c: "abc"
    };
  }
}
