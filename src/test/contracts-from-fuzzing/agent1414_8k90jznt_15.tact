struct Node3 { val: Int; }

struct Node2 { next: Node3?; }

struct Node1 { next: Node2?; }

contract DeepOptionalChain {
  n: Node1;

  init() {
    self.n = Node1 {
      next: Node2 {
        next: null
      }
    };
  }
}