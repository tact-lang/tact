struct Leaf {
  val: Int? = null;
}

struct Branch {
  leaf: Leaf? = null;
}

struct Tree {
  branch: Branch? = null;
}

contract Test {
  t: Tree = Tree{};

  init() {
    self.t = Tree{
      branch: Branch{
        leaf: Leaf{
          val: 42
        }
      }
    };
  }
}