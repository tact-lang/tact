struct Inner {
  x: Int;
}

struct Outer {
  inner: Inner;
  y: Bool;
}

contract Test {
  receive() {
    let s = Outer { inner: Inner { x: 1 }, y: false };
  }
}