struct Outer {
  inner: Inner;
}

struct Inner {
  x: Int;
}

contract Test {
  receive() {
    let inner: Inner = Inner { x: 10 };
    let outer: Outer = Outer { inner: inner };
  }
}