struct Inner {
  x: Int;
}

struct Outer {
  inner: Inner;
}

contract Test {
  receive() {
    let a = Inner{x: 5};
    let b = Outer{inner: a};
  }
}