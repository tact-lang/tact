struct Leaf { 
  data: Int;
}

struct Middle {
  l: Leaf;
  r: Leaf;
}

struct Root {
  a: Middle;
  b: Middle;
}

contract TreeContract {
  root: Root;

  init() {
    self.root = Root{
      a: Middle{ l: Leaf{ data: 1 }, r: Leaf{ data: 2 } },
      b: Middle{ l: Leaf{ data: 3 }, r: Leaf{ data: 4 } },
    };
  }
}