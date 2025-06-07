struct DeepLeaf {
  val: Int;
}

struct Node4 {
  leaf4: DeepLeaf;
}

struct Node3 {
  node4: Node4;
}

struct Node2 {
  node3: Node3;
}

struct Node1 {
  node2: Node2;
}

contract VeryDeep {
  root: Node1;

  init() {
    self.root = Node1{
      node2: Node2{
        node3: Node3{
          node4: Node4{
            leaf4: DeepLeaf{
              val: 123
            }
          }
        }
      }
    };
  }
}