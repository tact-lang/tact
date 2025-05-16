struct Leaf {
  val: Int = 42;
}

struct Branch {
  leaf: Leaf?;
}

struct Root {
  branch: Branch?;
}

contract TestContract {
  root: Root;

  init() {
    self.root = Root{
      branch: Branch{
        leaf: null
      }
    };
  }
}