struct NestedNested {
  a: Int;
  b: InnerMost;
}

struct InnerMost {
  c: InnerDeeper;
}

struct InnerDeeper {
  d: Int;
}

contract Test {
  big: NestedNested;

  init() {
    self.big = NestedNested{
      a: 8,
      b: InnerMost{
        c: InnerDeeper{ d:9 }
      }
    };
  }
}