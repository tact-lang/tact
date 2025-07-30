struct MiddleOpt {
  optInt: Int?;
  innerBool: Bool;
}

struct OuterOpt {
  mid: MiddleOpt?;
  id: Int;
}

contract TestMidNestedOpt {
  storage: OuterOpt;

  init() {
    self.storage = OuterOpt{
      mid: null,
      id: 5
    };
  }
}
