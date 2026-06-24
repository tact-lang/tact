struct Leaf {
  foo: Int;
}

struct Branch {
  left: Leaf;
  right: Leaf;
}

struct Tree {
  root: Branch;
}

contract TreeFields {
  data: Tree;

  init() {
    self.data = Tree { root: Branch { left: Leaf { foo: 1 }, right: Leaf { foo: 2 } } };
  }
}