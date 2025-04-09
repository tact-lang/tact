struct Outer {
  i: Int;
  inner: Inner;
}

struct Inner {
  s: String;
  b: Bool;
}

contract BigCombo {
  val: Outer;

  init() {
    self.val = Outer{ i:5, inner: Inner{ s:"hey", b:false } };
  }
}