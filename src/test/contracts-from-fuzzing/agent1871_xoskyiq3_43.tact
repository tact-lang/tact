struct Outer {
  i: Int;
  inner: Inner;
}

struct Inner {
  s: String;
  f: Bool;
}

contract NestOrder {
  val: Outer;

  init() {
    self.val = Outer{ i: 7, inner: Inner { s: "hi", f: false } };
  }
}