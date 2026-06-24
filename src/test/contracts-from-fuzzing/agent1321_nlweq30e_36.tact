// Large branching struct tree, combining optional and non-optional leaves
struct Leaf {
  a: Int;
  b: String?;
}

struct Node {
  left: Leaf?;
  right: Leaf?;
}

struct Mid {
  l: Node;
  r: Node;
}

contract CombinedTree {
  root: Mid;

  init() {
    self.root = Mid{
      l: Node{ left: null, right: Leaf{ a:1, b:null } },
      r: Node{ left: Leaf{ a:2, b:"x" }, right: null }
    };
  }
}
