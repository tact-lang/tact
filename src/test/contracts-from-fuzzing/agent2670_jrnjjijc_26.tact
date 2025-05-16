struct Leaf {
  x: Int;
}

struct Middle {
  leaf: Leaf;
}

struct Root {
  middle: Middle;
}

contract DeepThreeStructs {
  root: Root;

  init() {
    self.root = Root{ middle: Middle{ leaf: Leaf{ x: 42 } } };
  }
}