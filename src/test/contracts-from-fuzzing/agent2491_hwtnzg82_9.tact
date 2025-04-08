struct Leaf {
  num: Int;
}

struct Branch {
  leaf1: Leaf;
  leaf2: Leaf;
}

struct Tree {
  branch1: Branch;
  branch2: Branch;
}

contract NestedTree {
  tree: Tree;

  init() {
    self.tree = Tree{
      branch1: Branch{leaf1: Leaf{num: 1}, leaf2: Leaf{num: 2}},
      branch2: Branch{leaf1: Leaf{num: 3}, leaf2: Leaf{num: 4}},
    };
  }
}