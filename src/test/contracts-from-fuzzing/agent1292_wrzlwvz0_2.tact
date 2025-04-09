struct Deep {
  nested: Inner;
  flag: Bool;
}

struct Inner {
  x: Int;
  y: Bool;
}

contract Foo {
  val: Deep;

  init() {
    self.val = Deep{ nested: Inner{ x: 5, y: true }, flag: false };
  }
}