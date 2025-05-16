// test contract with many nested optionals + serialization formats
struct Leaf {
  x: Int as uint8;
  y: Bool?;
}

struct Branch {
  left: Leaf?;
  right: Leaf?;
}

contract TreeContract {
  root: Branch;
  init() {
    self.root = Branch{
      left: Leaf{ x: 5, y: null },
      right: null,
    };
  }
}