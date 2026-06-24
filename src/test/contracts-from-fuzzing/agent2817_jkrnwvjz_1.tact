struct Deep {
  count: Int;
  sub: Inner;
}

struct Inner {
  flag: Bool;
  val: Int;
}

contract TestContract {
  deepField: Deep;

  init() {
    self.deepField = Deep{ count: 1, sub: Inner{ flag: false, val: 2 } };
  }
}
