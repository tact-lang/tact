struct Leaf {
  x: Int?;
  y: Bool?;
}

struct Middle {
  leaf: Leaf?;
}

struct Root {
  mid: Middle?;
}

contract DeepNestedNulls {
  storage: Root;

  init() {
    self.storage = Root{};
  }
}
