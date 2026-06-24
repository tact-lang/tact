struct Nested {
  s: String;
}

struct Outer {
  inner: Nested;
}

contract Test {
  receive() {
    // do nothing
  }
}