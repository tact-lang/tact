struct InnerOpt {
  val: Int;
}

struct OuterOpt {
  inner: InnerOpt?;
}

contract NestedOptAssign {
  val: OuterOpt;

  init() {
    self.val = OuterOpt{inner: null};
  }
}