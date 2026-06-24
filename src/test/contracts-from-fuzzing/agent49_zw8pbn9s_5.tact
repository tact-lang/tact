struct Leaf {
  a: Int;
}

struct Node1 {
  left: Leaf;
  right: Leaf;
}

struct Node2 {
  left: Node1;
  right: Node1;
}

struct Root {
  left: Node2;
  right: Node2;
}

contract TreeTest {
  tree: Root;

  init() {
    let lf = Leaf{a:1};
    let n1 = Node1{left:lf, right:lf};
    let n2 = Node2{left:n1, right:n1};
    self.tree = Root{left:n2, right:n2};
  }
}