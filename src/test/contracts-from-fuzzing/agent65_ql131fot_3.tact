struct Inner {
  a: Int
}

struct Outer {
  inner: Inner
}

contract Test {
  receive() {
    let o = Outer{inner: Inner{a: 5}};
  }
}