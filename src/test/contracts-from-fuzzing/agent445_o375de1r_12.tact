// Large contract with deeply nested persistent struct
struct Leaf {
  val: Int;
}

struct Branch {
  left: Leaf;
  right: Leaf;
}

struct Tree {
  top: Branch;
  bottom: Branch;
}

contract TreeStorage {
  state: Tree;

  init() {
    self.state = Tree{
      top: Branch{
        left: Leaf{ val: 1 },
        right: Leaf{ val: 2 }
      },
      bottom: Branch{
        left: Leaf{ val: 3 },
        right: Leaf{ val: 4 }
      }
    };
  }
}
