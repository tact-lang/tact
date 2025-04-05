struct Foo {
  bar: Int
}

message Bar {
  baz: Foo
}

contract Test {
  receive() {
    // do nothing
  }
}