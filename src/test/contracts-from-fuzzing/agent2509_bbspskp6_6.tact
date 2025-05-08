struct Leaf {
  val: Int;
}

struct Level2 {
  left: Leaf;
  right: Leaf;
}

struct Level1 {
  l2a: Level2;
  l2b: Level2;
}

contract DeepWide {
  tree: Level1;

  init() {
    self.tree = Level1{
      l2a: Level2{ left: Leaf{val:1}, right: Leaf{val:2} },
      l2b: Level2{ left: Leaf{val:3}, right: Leaf{val:4} }
    };
  }
}