message Bar {
  foo: Foo;
}

message Foo {
  value: Int;
}

contract Test {
  receive(msg: Bar) {
    let v = msg.foo.value;
  }
}