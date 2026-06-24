struct Leaf {
  val: Int?;
}

struct Node {
  left: Leaf;
  right: Leaf;
}

struct Tree {
  root: Node;
}

contract TreeOptional {
  data: Tree;

  init() {
    self.data = Tree{
      root: Node{
        left: Leaf{ val: null },
        right: Leaf{ val: null },
      },
    };
  }
}