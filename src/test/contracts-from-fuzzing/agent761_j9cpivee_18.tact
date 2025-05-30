struct Leaf { val: Int }
struct Branch { left: Leaf?; right: Leaf? }
struct Tree { root: Branch? }

contract SparseBinaryTree {
  tree: Tree;

  init() {
    self.tree = Tree{
      root: Branch{
        left: null,
        right: Leaf{ val: 42 },
      }
    };
  }
}