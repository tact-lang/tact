struct OptionalNest {
  v1: Int?;
  v2: String?;
  v3: Cell?;
  v4: Slice?;
}

contract NestedOptionals {
  state: OptionalNest;

  init() {
    self.state = OptionalNest{
      v1: null,
      v2: null,
      v3: null,
      v4: null
    };
  }
}