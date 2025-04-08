struct S {
  a: Int?;
  b: Bool?;
}

contract OnlyOptionals {
  s: S;

  init() {
    self.s = S{
      a: null,
      b: null,
    };
  }
}