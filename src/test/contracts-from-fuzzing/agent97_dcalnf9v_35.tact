struct OuterMost {
  val: Int;
  inner: InnerMost;
}

struct InnerMost {
  innerVal: Int;
}

contract NestedOrdering {
  data: OuterMost;
  init() {
    self.data = OuterMost{
      val: 1,
      inner: InnerMost{ innerVal: 2 }
    };
  }
}