struct Leaf {
  prim: Int?;
}

struct Mid {
  leaf: Leaf;
  flag: Bool;
}

struct Outer {
  mid: Mid;
}

contract OptionalWithValue {
  storage: Outer;

  init() {
    self.storage = Outer{
      mid: Mid{
        leaf: Leaf{
          prim: 99,
        },
        flag: false,
      },
    };
  }
}
