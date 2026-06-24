struct Leaf {
  foo: Int?;
  bar: Bool;
}

struct Mid {
  a: Leaf?;
  b: Leaf;
}

struct Top {
  left: Mid;
  right: Mid?;
}

contract Test {
  storage: Top = Top{
    left: Mid{
      a: null,
      b: Leaf{ foo:1, bar:true }
    },
    right: null
  };
}