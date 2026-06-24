struct Deep {
  s1: String;
  s2: String;
  inner: InnerMost;
}

struct InnerMost {
  val1: Int;
  val2: Bool;
}

contract DeeplyNested {
  deep: Deep;

  init() {
    self.deep = Deep{
      s1: "a",
      s2: "b",
      inner: InnerMost{val1: 1, val2: true}
    };
  }
}
