struct OptionalNestedDefault {
  a: Int? = null;
  b: Bool? = null;
}

struct Holder {
  nested: OptionalNestedDefault = OptionalNestedDefault{};
}

contract NestedDefaultOptionalContract {
  data: Holder;

  init() {
    self.data = Holder{};
  }
}
