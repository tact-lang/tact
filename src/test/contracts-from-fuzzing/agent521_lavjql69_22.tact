// Test null assignments to all optional struct fields nested
struct Child {
  x: Int?;
  y: Bool?;
}

struct Parent {
  child: Child?;
}

contract NestedNullContract {
  store: Parent;

  init() {
    self.store = Parent{
      child: null,
    };
  }
}