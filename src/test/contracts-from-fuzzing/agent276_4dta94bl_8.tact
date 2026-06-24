struct Leaf {
  p: Int;
  q: Bool;
  r: String;
}

struct Node3 {
  leaf: Leaf;
}

struct Node2 {
  node3: Node3;
}

struct Node1 {
  node2: Node2;
}

contract DeepNest4 {
  val: Node1;

  init() {
    self.val = Node1{
      node2: Node2{
        node3: Node3{
          leaf: Leaf{
            p: 5,
            q: true,
            r: "hello",
          },
        },
      },
    };
  }
}
