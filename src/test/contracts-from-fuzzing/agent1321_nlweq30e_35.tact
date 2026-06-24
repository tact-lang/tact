// deeply nested optional chain with large structs at leaves
struct Leaf {
  a: Int?;
  b: Bool?;
  c: String?;
}

struct Node {
  left: Leaf?;
  right: Leaf?;
}

struct Tree {
  root: Node?;
}

contract OptTree {
  t: Tree;

  init() {
    self.t = Tree{
      root: Node{
        left: Leaf{a:null, b:true, c:"x"},
        right: null
      }
    };
  }
}
