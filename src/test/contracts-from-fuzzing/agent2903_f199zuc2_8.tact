struct Leaf {
  str: String;
  num: Int;
}

struct Branch {
  left: Leaf;
  right: Leaf;
}

struct Tree {
  root: Branch;
  height: Int;
}

contract TreeContract {
  t: Tree = Tree{
    root: Branch{
      left: Leaf{ str: "L", num: 1 },
      right: Leaf{ str: "R", num: 2 }
    },
    height: 1
  };
}