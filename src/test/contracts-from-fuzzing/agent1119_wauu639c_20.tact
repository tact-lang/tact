// Large deeply nested mixed optional struct
struct Leaf {
  val: Int?;
}

struct Mid {
  left: Leaf?;
  right: Leaf?;
}

struct Root {
  branch1: Mid?;
  branch2: Mid?;
}

contract TreeContract {
  top: Root;

  init() {
    self.top = Root{
      branch1: Mid{left: Leaf{val:null}, right: null},
      branch2: null
    };
  }
}