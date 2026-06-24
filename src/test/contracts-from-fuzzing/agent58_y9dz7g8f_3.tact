struct Inner {
  a: Int
}

struct Outer {
  inner: Inner
}

contract Test {
    receive() {
        // Do nothing
    }
}