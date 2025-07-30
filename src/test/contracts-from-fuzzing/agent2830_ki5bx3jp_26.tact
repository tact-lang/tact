struct InnerMost {
  value: Int;
}

struct Mid {
  inner: InnerMost;
}

struct TopMost {
  m: Mid;
}

contract AssignChain {
  field: TopMost;
  init() {
    self.field = TopMost{
      m: Mid{ inner: InnerMost{value:123} }
    };
  }
}