struct Leaf {
  d: String;
}

struct Branch {
  l1: Leaf;
  l2: Leaf;
}

contract TreeStruct {
  root: Branch;

  init() {
    self.root = Branch{
      l1: Leaf{ d: "a" },
      l2: Leaf{ d: "b" }
    };
  }
}