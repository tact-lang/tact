struct TripleNesting {
  a: Int;
  b: String;
}

struct Middle {
  inner: TripleNesting;
  flag: Bool;
}

struct OuterMost {
  mid: Middle;
  description: String;
}

contract VeryNested {
  data: OuterMost;
  init() {
    self.data = OuterMost{
      mid: Middle{
        inner: TripleNesting{ a: 7, b: "x" },
        flag: true
      },
      description: "deep"
    };
  }
}