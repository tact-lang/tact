struct A {
  x: Int
}

struct B {
  y: A?
}

contract Test {
  receive() {
    // Do nothing
  }
}