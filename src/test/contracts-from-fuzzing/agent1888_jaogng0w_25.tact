struct Leaf {
  val: Int?;
}

struct Node {
  left: Leaf;
  right: Leaf;
}

struct Top {
  n1: Node;
  n2: Node;
}

contract OptLeaves {
  data: Top;

  init() {
    self.data = Top{
      n1: Node{left:Leaf{val:null}, right:Leaf{val:5}},
      n2: Node{left:Leaf{val:10}, right:Leaf{val:null}}
    };
  }
}
