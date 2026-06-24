struct Inner {
  x: Int;
}

struct Outer {
  maybeInner: Inner?;
}

contract Test {
  receive() {}
}