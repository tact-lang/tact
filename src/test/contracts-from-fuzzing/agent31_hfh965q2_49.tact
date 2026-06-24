struct Tree {
   left: Int?;
   right: Int?;
   data: Int;
}

contract BinaryTree {
  root: Tree;

  init() {
    self.root = Tree{left:null,right:null,data:42};
  }
}