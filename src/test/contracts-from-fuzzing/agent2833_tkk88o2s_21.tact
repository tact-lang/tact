struct Deep {
  foo: Int;
  inner: Middle;
}

struct Middle {
  bar: Int;
  inner: Leaf;
}

struct Leaf {
  baz: Int;
}

contract Layered {
  nested: Deep;

  init() {
    self.nested = Deep{
      foo:1,
      inner: Middle{
        bar:2,
        inner: Leaf{
          baz:3
        }
      }
    };
  }
}