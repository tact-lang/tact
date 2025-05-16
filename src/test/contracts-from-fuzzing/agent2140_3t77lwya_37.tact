struct Leaf { n: Int; }
struct Node { left: Leaf?; right: Leaf?; }

struct TreeStruct {
  root: Node;
}

contract Tree {
  data: TreeStruct;
  init() {
    self.data = TreeStruct { root: Node{ left:null, right:null } };
  }
}
