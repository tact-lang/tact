struct Outer {
  inner: Inner
}

struct Inner {
  value: Int
}

contract Test {
  receive() {
    let o = Outer{inner: Inner{value: 42}};
  }
}