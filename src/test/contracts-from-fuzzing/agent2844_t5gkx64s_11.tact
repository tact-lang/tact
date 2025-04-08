struct Leaf {
  val: Int;
}

struct Node {
  a: Leaf;
  b: Leaf;
}

struct Root {
  left: Node;
  right: Node;
}

contract TestContract {
  root: Root;

  init() {
    self.root = Root{
      left: Node{
        a: Leaf{val: 1},
        b: Leaf{val: 2}
      },
      right: Node{
        a: Leaf{val: 3},
        b: Leaf{val: 4}
      }
    };
  }
}