// Deep mix optional and defaults
struct Leaf {
  a: Int = 7;
  b: Bool = false;
  c: String?;
}

struct Mid {
  left: Leaf?;
  right: Leaf;
}

contract OptDefaultMix {
  root: Mid;
  init() {
    self.root = Mid {
      left: null,
      right: Leaf{},
    };
  }
}