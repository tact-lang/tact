// Many nested levels of optionals combined with deep persistence
struct Leaf {
  v: Int;
}

struct Branch {
  leaf: Leaf?;
}

struct Tree {
  b: Branch?;
}

struct Forest {
  t: Tree?;
}

contract NestedOptionalForest {
  f: Forest?;

  init() {
    self.f = Forest{
      t: null,
    };
  }
}