struct Foo {
  bar: Int
}

message Bar {
  baz: Foo
}

contract Test {
  receive(message: Bar) {
    // test message receive
  }
}