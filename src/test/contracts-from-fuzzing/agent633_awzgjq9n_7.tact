struct NestedDefault {
  a: Int = 1;
}

struct OuterDefault {
  inner: NestedDefault = NestedDefault{};
}

contract NestedDefaultContract {
  data: OuterDefault;

  init() {
    self.data = OuterDefault{};
  }
}
