struct Leaf { val: Int }

struct Node1 { leaf: Leaf }
struct Node2 { node1: Node1 }
struct Node3 { node2: Node2 }

contract DeepChain {
  data: Node3;

  init() {
    self.data = Node3{ node2: Node2{ node1: Node1{ leaf: Leaf{ val: 42 } } } };
  }
}