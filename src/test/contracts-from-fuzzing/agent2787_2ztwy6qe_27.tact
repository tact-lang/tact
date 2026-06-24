struct Leaf {
  i: Int;
}

struct Middle {
  l: Leaf;
  opt: Int?;
}

struct Root {
  m: Middle;
  flag: Bool;
  txt: String;
}

contract Nested {
  r: Root;
  init() {
    self.r = Root{
        m: Middle{ l: Leaf{i:7}, opt:null },
        flag: true,
        txt: "hi"
    };
  }
}
