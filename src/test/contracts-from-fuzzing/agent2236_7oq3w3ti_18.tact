struct Leaf { val: Int }

struct Branch {
  one: Leaf?;
  two: Leaf?;
}

struct Root {
  br1: Branch;
  br2: Branch;
}

contract OptTree {
  tree: Root;

  init() {
    self.tree = Root{
      br1: Branch{ one: null, two: null },
      br2: Branch{ one: null, two: null }
    };
  }
}