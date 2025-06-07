struct Leaf {
  z: Int?;
}

struct Node {
  leaf: Leaf?;
}

struct Container {
  n1: Node?;
  n2: Node?;
  n3: Node?;
  n4: Node?;
}

contract TestContract {
  val: Container;

  init() {
    self.val = Container{
      n1:null,
      n2:Node{leaf:null},
      n3:null,
      n4:Node{leaf:Leaf{z:null}}
    };
  }
}