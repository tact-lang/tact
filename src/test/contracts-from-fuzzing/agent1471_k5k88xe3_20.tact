struct S {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
}

contract DefaultsOptional {
    s: S;
    init() {
      self.s = S{
        a: null,
        b: null,
        c: null,
        d: null,
      };
    }
}
