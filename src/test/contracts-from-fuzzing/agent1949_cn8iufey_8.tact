struct Leaf1 {
  foo: Int;
}

struct Leaf2 {
  bar: String;
}

struct Middle {
  l1: Leaf1;
  l2: Leaf2;
}

struct Root {
  mid: Middle;
  leaf: Leaf2;
}

contract DeepTree {
  r: Root;

  init() {
    self.r = Root{
      mid: Middle{
        l1: Leaf1{foo: 1},
        l2: Leaf2{bar: "hi"}
      },
      leaf: Leaf2{bar: "bye"}
    };
  }
}
