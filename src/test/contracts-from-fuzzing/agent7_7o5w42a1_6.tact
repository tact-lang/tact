struct Inner {
  a: Int;
}

struct Outer {
  inner: Inner;
}

contract Test {
  receive() {
    let y = Inner { a: 7 };
    let x = Outer { inner: y };
  }
}