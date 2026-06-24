struct Nested {
  inner: Pair;
}

struct Pair {
  a: Int;
  b: Int;
}

contract Test {
  receive() {
    let p = Nested { inner: Pair { a: 5, b: 10 } };
  }
}