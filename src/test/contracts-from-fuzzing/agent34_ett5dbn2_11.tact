struct Inner {
  i: Int;
}

struct Outer {
  inner: Inner;
}

contract Test {
  receive() {
    // do nothing
  }
}