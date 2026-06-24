struct DeepOpt {
  innerOpt: Int?;
  s: String?;
}

struct NestedOpt {
  d: DeepOpt?;
  b: Bool;
}

contract OptInOpt {
  data: NestedOpt;
  init() {
    self.data = NestedOpt{
      d: null,
      b: true
    };
  }
}