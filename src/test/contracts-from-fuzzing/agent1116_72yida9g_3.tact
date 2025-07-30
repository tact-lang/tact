struct Inner {
  val: Int;
}

struct Middle {
  nested: Inner;
}

struct Outer {
  mid: Middle;
}

contract NestedContract {
  item: Outer;

  init() {
    self.item = Outer{ mid: Middle{ nested: Inner{ val: 123 } } };
  }
}
