struct Inner {
  x: Int;
}

struct Outer {
  inner: Inner;
}

contract Test {
  receive() {
    let o = Outer{inner: Inner{x: 5}};
  }
}