struct InnerMost {
  leaf: Int = 5;
  flag: Bool?;
}

struct Inner {
  child: InnerMost;
  data: Int?;
}

contract Test {
  deep: Inner;

  init() {
    self.deep = Inner{
      child: InnerMost{},
      data: null
    };
  }
}