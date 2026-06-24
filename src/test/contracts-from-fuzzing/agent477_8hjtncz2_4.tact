struct InnerOpt {
  val: Int?;
}

struct OuterOpt {
  inner: InnerOpt?;
}

contract NestedOptionalStructs {
  outer: OuterOpt;

  init() {
    self.outer = OuterOpt{ inner: null };
  }
}