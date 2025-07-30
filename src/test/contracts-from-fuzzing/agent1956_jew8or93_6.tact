struct OptionalNested {
  innerOpt: Inner?;
}

struct Inner {
  val: Int;
}

contract Test {
  field: OptionalNested;

  init() {
    self.field = OptionalNested{ innerOpt: null };
  }
}