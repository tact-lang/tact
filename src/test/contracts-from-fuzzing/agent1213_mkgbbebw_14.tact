struct InnerOpt {
  v: Int?;
}

struct OuterOpt {
  in1: InnerOpt?;
  in2: InnerOpt?;
}

contract OptNestedOpt {
  state: OuterOpt;

  init() {
    self.state = OuterOpt{ in1: null, in2: null };
  }
}