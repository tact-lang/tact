struct NestedOptionals {
  one: Int?;
  two: Bool?;
  three: String?;
  four: Address?;
}

struct Container {
  inner: NestedOptionals?;
}

contract TestContract {
  field: Container;

  init() {
    self.field = Container { inner: null };
  }
}