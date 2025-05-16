struct Leaf {
  x: Int;
}

struct TreeNode {
  val: Int;
  left: Leaf;
  right: Leaf;
}

contract BinaryTree {
  root: TreeNode = TreeNode{
    val:0,
    left:Leaf{x:1},
    right:Leaf{x:2}
  };
}