struct ChildA {
  val: Int;
}

struct ChildB {
  val: Int;
}

struct Top {
  left: ChildA;
  right: ChildB;
}

contract BranchStorage {
  root: Top;

  init() {
    self.root = Top{
      left: ChildA{ val: 10 },
      right: ChildB{ val: 20 }
    };
  }
}