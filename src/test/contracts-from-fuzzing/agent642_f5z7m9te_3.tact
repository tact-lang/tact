struct NestedLevel2 {
  x: Int;
}

struct NestedLevel1 {
  inner: NestedLevel2;
  y: Bool;
}

contract TestContract {
  store: NestedLevel1;

  init() {
    self.store = NestedLevel1{ inner: NestedLevel2{ x: 10 }, y: true };
  }
}