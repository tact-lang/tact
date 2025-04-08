struct InnerMost {
  z: Int;
}

struct InnerOpt {
  t: InnerMost?;
}

struct OuterOpt {
  v: InnerOpt?;
}

contract SeriouslyNestedOpt {
  data: OuterOpt;
  init() {
    self.data = OuterOpt{v: InnerOpt{t: InnerMost{z: 999}}};
  }
}