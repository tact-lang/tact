struct Inner {
  flag: Bool;
}

struct Middle {
  val: Int;
  inner: Inner;
}

struct Outer {
  middle: Middle;
  txt: String;
}

contract NestedOpts {
  outer: Outer = Outer{middle: Middle{val: 5, inner: Inner{flag: true}}, txt: "a"};

  init() {
    self.outer = Outer{middle: Middle{val: 123, inner: Inner{flag: false}}, txt: "updated"};
  }
}
