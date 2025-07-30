struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
}

contract Test {
  receive() {
    // test nesting
  }
}