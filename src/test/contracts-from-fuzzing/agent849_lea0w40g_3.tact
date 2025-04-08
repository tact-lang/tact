struct DeepNested {
  a: Int;
  inner: Inner;
}

struct Inner {
  b: Int?;
  leaf: Leaf;
}

struct Leaf {
  c: Int;
  d: Int?;
}

contract TestContract {
  tree: DeepNested;

  init() {
    self.tree = DeepNested{
      a: 5,
      inner: Inner{
        b: null,
        leaf: Leaf{
          c: 1,
          d: null,
        },
      },
    };
  }
}