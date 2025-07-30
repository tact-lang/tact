struct Inner {
  x: Int
}

struct Outer {
  inner: Inner
}

contract Test {
  receive() {
    // Intentionally empty
  }
}