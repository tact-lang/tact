// contract with deeply nested multi-level defaults/optionals combo
struct InnerMost {
  x: Int? = null;
}

struct Middle {
  m: InnerMost? = null;
}

struct Outer {
  o: Middle? = null;
}

contract NestedDeepDefaults {
  storage: Outer;
  init() {
    self.storage = Outer{};
  }
}