message Foo {
  value: Int;
}

contract Test {
  receive(msg: Foo) {
    let v = msg.value + 1;
  }
}