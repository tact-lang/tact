struct InnerOpt {
  foo: Int?;
}

struct OuterOpt {
  bar: InnerOpt?;
}

contract NestedOpt {
  data: OuterOpt;

  init() {
    self.data = OuterOpt{ bar: null };
  }
}