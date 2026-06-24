struct Maybe {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract AllOptionalStruct {
  m: Maybe;

  init() {
    self.m = Maybe{
      a: null,
      b: null,
      c: null
    };
  }
}