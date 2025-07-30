struct Leaf {
  x: Int;
}

struct Branch1 {
  l1: Leaf;
  l2: Leaf;
}

struct Branch2 {
  b1: Branch1;
  b2: Branch1;
}

struct Tree {
  root: Branch2;
}

contract TreeContract {
  tree: Tree;

  init() {
    self.tree = Tree{
      root: Branch2{
        b1: Branch1{ l1: Leaf{ x:1 }, l2: Leaf{ x:2 } },
        b2: Branch1{ l1: Leaf{ x:3 }, l2: Leaf{ x:4 } },
      },
    };
  }
}