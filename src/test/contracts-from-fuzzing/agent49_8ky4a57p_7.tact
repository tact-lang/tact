struct Outer {
  inner: Inner;
}

struct Inner {
  value: Int;
}

contract Test {
  receive() {
    let a: Int = 1;
  }
}