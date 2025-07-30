struct Leaf {
  value: Int;
}

struct Node {
  left: Leaf;
  right: Leaf;
  caption: String;
}

struct Tree {
  root: Node;
  label: String;
}

contract NestedTreeTest {
  tree: Tree;

  init() {
    self.tree = Tree{
      root: Node{
        left: Leaf{value: 1},
        right: Leaf{value: 2},
        caption: "root node"
      },
      label: "whole tree"
    };
  }
}