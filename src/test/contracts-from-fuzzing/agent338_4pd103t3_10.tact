struct Leaf {
  x: Int;
}

struct Branch {
  leaf: Leaf?;
  label: String;
}

struct Tree {
  root: Branch?;
  name: String;
}

contract TestContract {
  bigTree: Tree;

  init() {
    self.bigTree = Tree{
      root: null,
      name: "Rootless"
    };
  }
}