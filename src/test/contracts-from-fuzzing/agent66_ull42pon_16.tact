// Deep struct nesting with optional leaves
struct Leaf { a: Int?; b: Bool?; c: String?; }
struct Node { left: Leaf; right: Leaf; }
contract Tree {
  root: Node;
  init() {
    self.root = Node{
      left: Leaf{a: null, b: null, c: null},
      right: Leaf{a: null, b: null, c: null},
    };
  }
}