struct AllOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract AllNulls {
  s: AllOptionals;

  init() {
    self.s = AllOptionals{
      a: null,
      b: null,
      c: null
    };
  }
}