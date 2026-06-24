struct InnerOpt {
  a: Int?;
  b: Bool?;
}

struct OuterOpt {
  inner: InnerOpt?;
}

contract NestedOptionalsD {
  data: OuterOpt;

  init() {
    self.data = OuterOpt{ inner: null };
  }
}
