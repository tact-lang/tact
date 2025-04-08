struct Leaf {
  val: Int;
}

struct Node {
  left: Leaf;
  right: Leaf;
}

contract NestInit {
  n: Node = Node{
    left: Leaf{val: 1},
    right: Leaf{val: 2},
  };
}