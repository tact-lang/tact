struct Leaf {
  x: Int = 1;
}

struct Mid {
  leaf: Leaf? = Leaf{ x: 2 };
  num: Int? = null;
}

struct Top {
  mid: Mid? = null;
}

contract Test {
  data: Top;

  init() {
    self.data = Top{};
  }
}