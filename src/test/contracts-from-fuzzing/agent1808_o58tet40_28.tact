struct InnerS {
  value: Int;
}

struct MiddleS {
  i1: InnerS;
  i2: InnerS;
}

struct OuterS {
  m1: MiddleS;
  m2: MiddleS;
}

contract TripleNest {
  big: OuterS;

  init() {
    self.big = OuterS{
      m1: MiddleS{ i1: InnerS{value:1}, i2: InnerS{value:2} },
      m2: MiddleS{ i1: InnerS{value:3}, i2: InnerS{value:4} }
    };
  }
}