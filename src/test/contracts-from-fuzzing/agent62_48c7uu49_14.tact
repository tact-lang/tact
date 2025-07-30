struct Leaf {
  x: Int;
}

struct Mid {
  leaf: Leaf;
}

struct Root {
  mid: Mid;
}

contract Test14 {
  data: Root;
  init() {
    self.data = Root{
      mid: Mid{
        leaf: Leaf{x:123}
      }
    };
  }
}