struct Leaf {
  z: Int;
}

struct Branch {
  leaf: Leaf?;
}

contract NestedOptional {
  tree: Branch;

  init() {
    self.tree = Branch{ leaf: null };
  }
}
