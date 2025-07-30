struct Inner {
  val: Int?;
}

struct Middle {
  inner: Inner?;
}

contract InitNestedOpt {
  store: Middle;

  init() {
    self.store = Middle{
      inner: Inner{ val: 42 }
    };
  }
}