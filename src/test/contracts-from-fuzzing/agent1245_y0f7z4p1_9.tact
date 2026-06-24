struct SubNested {
  i: Int?;
}

struct Aggregate {
  a: Int;
  b: Bool;
  c: String?;
  d: SubNested;
  e: SubNested?;
}

contract OptionalMix {
  stuff: Aggregate;

  init() {
    self.stuff = Aggregate{
      a: 1,
      b: true,
      c: null,
      d: SubNested { i: null },
      e: null,
    };
  }
}
