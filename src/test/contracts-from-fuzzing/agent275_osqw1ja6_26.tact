struct Leaf {
  a: Int?;
  b: Bool;
}

struct Middle {
  leaf1: Leaf;
  leaf2: Leaf;
  optional_leaf: Leaf?;
}

struct Root {
  mid1: Middle;
  mid2: Middle?;
  val: Int;
}

contract TestContract {
  stored: Root;

  init() {
    self.stored = Root{
      mid1: Middle{
        leaf1: Leaf{a:null,b:true},
        leaf2: Leaf{a:5,b:false},
        optional_leaf: null,
      },
      mid2: null,
      val: 42,
    };
  }
}