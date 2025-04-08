struct S1 {
  a: Int;
}

struct S2 {
  b: Int?;
  s: S1?;
}

contract OptionalNested {
  field: S2;

  init() {
    self.field = S2{
      b: null,
      s: null
    };
  }
}