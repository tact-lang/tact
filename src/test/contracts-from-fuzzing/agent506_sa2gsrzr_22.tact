struct Child {
  x: Int = 7;
}

struct Parent {
  c: Child? = null;
}

contract OptionalNestedDefault {
  data: Parent = Parent{};

  init() {
    self.data = Parent{};
  }
}