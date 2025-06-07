struct Leaf {
  value: Int?;
}

struct Branch {
  left: Leaf;
  right: Leaf;
}

struct Root {
  b: Branch;
}

contract OptionalTree {
  tree: Root;
  
  init() {
    self.tree = Root { b: Branch { left: Leaf{value:null}, right: Leaf{value:42} } };
  }
}