struct TreeLevel3 {
  v: Int;
}

struct TreeLevel2 {
  left: TreeLevel3;
  right: TreeLevel3;
}

struct TreeLevel1 {
  left: TreeLevel2;
  right: TreeLevel2;
}

contract Test49 {
  tree: TreeLevel1;

  init() {
    self.tree = TreeLevel1{
      left: TreeLevel2{
        left: TreeLevel3{v:1},
        right: TreeLevel3{v:2}
      },
      right: TreeLevel2{
        left: TreeLevel3{v:3},
        right: TreeLevel3{v:4}
      }
    };
  }
}