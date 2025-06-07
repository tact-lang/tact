// nested optional with empty inner defaults and primitive serializations
struct DeepInner {
  a: Int? = null;
  b: Bool? = null;
}

struct DeepOuter {
  di: DeepInner? = null;
}

contract NestedOptNulls {
  root: DeepOuter;
  init() {
    self.root = DeepOuter{};
  }
}