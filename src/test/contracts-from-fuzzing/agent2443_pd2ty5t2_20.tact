// deeply nested with mixed optional and required
struct Leaf {
  a:Int;
  b:Int?;
}
struct Node {
  left: Leaf;
  right: Leaf?;
}
struct Tree {
  root:Node;
}

contract TestContract {
  myTree: Tree;
  init() {
    self.myTree = Tree{
      root: Node{
        left: Leaf{a:1,b:null},
        right:null
      }
    };
  }
}