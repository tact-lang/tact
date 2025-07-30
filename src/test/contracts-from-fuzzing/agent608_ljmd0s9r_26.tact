// Struct with deeply nested explicit default values
struct Leaf {
  x: Int = 7;
}

struct Middle {
  leaf: Leaf = Leaf{};
}

struct Root {
  m: Middle = Middle{};
}

contract DeepNestedDefaults {
  val: Root;
  init() {
    self.val = Root{};
  }
}
