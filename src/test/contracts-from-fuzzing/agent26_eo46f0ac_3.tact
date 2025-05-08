struct Nested {
  value: Int
}

struct Outer {
  nested: Nested
}

contract Test {
  receive() {
    let a = Outer{ nested: Nested{ value: 5 } };
  }
}