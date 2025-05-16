struct Inner {
  x: Int;
}

struct Outer {
  inner: Inner;
}

contract Test {
  receive() {
    let s = Outer { inner: Inner { x: 10 } };
  }
}