message Foo {
  f: Int;
}

message Bar {
  foo: Foo;
}

contract Test {
  receive(msg: Bar) {
    msg.foo.f = 7;
  }
}