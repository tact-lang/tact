struct SOpt {
  optInt: Int?;
  optBool: Bool?;
}

struct OuterWrap {
  inner1: SOpt;
  inner2: SOpt?;
}

contract ComplexWrap {
  wrap: OuterWrap;

  init() {
    self.wrap = OuterWrap{
      inner1: SOpt{optInt: null, optBool: null},
      inner2: SOpt{optInt: 5, optBool: true}
    };
  }
}
