struct InnerS {
  v: Int;
}

struct MidS1 {
  a: InnerS;
}

struct MidS2 {
  b: InnerS;
}

struct TopS {
  m1: MidS1;
  m2: MidS2;
}

contract WideDeep {
  payload: TopS;

  init() {
    self.payload = TopS{
      m1: MidS1{a: InnerS{v:1}},
      m2: MidS2{b: InnerS{v:2}}
    };
  }
}