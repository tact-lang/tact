struct Leaf {
  val: Int;
}

struct Branch {
  left: Leaf;
  right: Leaf;
}

struct Tree {
  root: Branch;
}

contract TreeHolder {
  t: Tree;

  init() {
    self.t = Tree{
      root: Branch{
        left: Leaf{ val: 10 },
        right: Leaf{ val: 20 }
      }
    };
  }
}