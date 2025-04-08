struct Leaf {
  b: Bool;
}

struct Node {
  val: Int;
  left: Leaf;
  right: Leaf;
}

struct Root {
  n1: Node;
  n2: Node;
}

contract TreeStorage {
  tree: Root = Root{
    n1: Node{val:1,left:Leaf{b:true},right:Leaf{b:false}},
    n2: Node{val:2,left:Leaf{b:false},right:Leaf{b:true}}
  };

  init() {
    self.tree = Root{
      n1: Node{val:10,left:Leaf{b:false},right:Leaf{b:true}},
      n2: Node{val:20,left:Leaf{b:true},right:Leaf{b:false}}
    };
  }
}
