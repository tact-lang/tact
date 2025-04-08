struct InnerOpt {
  optInt: Int?;
  optBool: Bool?;
}

struct OuterOpt {
  value: Int;
  nestedOpt: InnerOpt?;
}

contract Baz {
  data: OuterOpt;

  init() {
    self.data = OuterOpt {
      value: 1,
      nestedOpt: null
    };
  }
}