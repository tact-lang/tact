struct InnerMost {
  x: Int;
}

struct InnerMid {
  a: InnerMost;
}

struct InnerTop {
  m: InnerMid;
}

contract NarrowDeep {
  deep: InnerTop;

  init() {
    self.deep = InnerTop{m: InnerMid{a: InnerMost{x: 123}}};
  }
}