struct Foo {
  bar: Bar
}

struct Bar {
  x: Int
}

contract Test {
  receive() {
    // just use structs
  }
}