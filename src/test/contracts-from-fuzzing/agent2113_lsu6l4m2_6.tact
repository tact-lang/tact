struct OptionalNest {
  inner: Int?;
}

struct Outer {
  innerStruct: OptionalNest?;
}

contract NestedOptionalStructs {
  val: Outer;

  init() {
    self.val = Outer{
      innerStruct: null
    };
  }
}