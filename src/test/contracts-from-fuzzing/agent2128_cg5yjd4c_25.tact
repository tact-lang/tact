struct Leaf {
  a: Int;
}

struct Branch {
  left: Leaf?;
  right: Leaf?;
}

contract OptionalTree {
  root: Branch?;

  init() {
    self.root = Branch{
      left: null,
      right: null
    };
  }
}