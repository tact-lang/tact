struct InnerS {
  i: Int?;
  b: Bool;
}

struct OuterS {
  s1: InnerS;
  s2: InnerS;
}

contract OptNestedCombo {
  data: OuterS;

  init() {
    self.data = OuterS{
      s1: InnerS{i: null, b: true},
      s2: InnerS{i: 42, b: false},
    };
  }
}