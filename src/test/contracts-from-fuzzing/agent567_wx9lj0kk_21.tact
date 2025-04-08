// multiple layers of contract persistent structs with no default values
struct Leaf {
  val: Int;
}

struct Branch {
  left: Leaf;
  right: Leaf;
}

struct Tree {
  b1: Branch;
  b2: Branch;
}

contract Trees {
  t1: Tree;
  t2: Tree;

  init() {
    self.t1 = Tree {
      b1: Branch { left: Leaf{val:1}, right: Leaf{val:2} },
      b2: Branch { left: Leaf{val:3}, right: Leaf{val:4} },
    };
    self.t2 = Tree {
      b1: Branch { left: Leaf{val:5}, right: Leaf{val:6} },
      b2: Branch { left: Leaf{val:7}, right: Leaf{val:8} },
    };
  }
}
