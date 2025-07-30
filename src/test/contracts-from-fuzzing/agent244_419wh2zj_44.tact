// Large persistent state with many mixed optional, defaults, nested structs

struct Node {
  a: Int?;
  b: Bool = false;
  s: String?;
}

contract LargeNestedMix {
  f1: Node?;
  f2: Node;
  f3: Node?;
  f4: Node;

  init() {
    self.f1 = null;
    self.f2 = Node{
      a: 1,
      b: true,
      s: "f2"
    };
    self.f3 = Node{
      a: null,
      b: false,
      s: null
    };
    self.f4 = Node{};
  }
}