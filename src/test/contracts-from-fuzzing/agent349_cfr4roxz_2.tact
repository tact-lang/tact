struct Inner {
  value: Int;
}

struct Middle {
  inner: Inner?;
}

struct Outer {
  middle: Middle;
}

contract NestedOptionals {
  big: Outer;
  init() {
    self.big = Outer{ middle: Middle{ inner: Inner{ value: 7 } } };
  }
}