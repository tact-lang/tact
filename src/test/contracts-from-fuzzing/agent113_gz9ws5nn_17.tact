struct OptionalWrapper {
  inner: Int?;
}

struct NestedWrapper {
  wrap: OptionalWrapper;
}

contract NestedOptionalWrapper {
  data: NestedWrapper;

  init() {
    self.data = NestedWrapper{ wrap: OptionalWrapper{inner:null} };
  }
}