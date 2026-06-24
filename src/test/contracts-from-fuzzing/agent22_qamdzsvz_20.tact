struct OuterOpt {
  innerOpt: InnerOpt?;
}

struct InnerOpt {
  value: Int?;
}

contract DeepOptChain {
  data: OuterOpt;

  init() {
    self.data = OuterOpt{ innerOpt: null };
  }
}