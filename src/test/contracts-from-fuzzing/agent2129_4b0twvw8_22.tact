struct NestedEmptyOpt {
  val: Int?;
}

struct OuterOpt {
  inner: NestedEmptyOpt?;
}

contract NestedNulls {
  st: OuterOpt;

  init() {
    self.st = OuterOpt{
      inner: null
    };
  }
}