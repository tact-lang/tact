struct Leaf {
  x: Int = 1;
  y: Bool? = null;
}

struct Mid {
  leaf: Leaf = Leaf{};
  s: String? = null;
}

struct Root {
  mid: Mid = Mid{};
  flag: Bool = true;
}

contract Test {
  data: Root;

  init() {
    self.data = Root{};
  }
}
