struct InnerMost {
  val: Int;
}

struct MidLevel {
  a: InnerMost;
  b: InnerMost;
}

struct TopLevel {
  m1: MidLevel;
  m2: MidLevel;
}

contract NestedMulti {
  st: TopLevel;

  init() {
    self.st = TopLevel{
      m1: MidLevel{ a: InnerMost{ val: 1 }, b: InnerMost{ val: 2 } },
      m2: MidLevel{ a: InnerMost{ val: 3 }, b: InnerMost{ val: 4 } }
    };
  }
}