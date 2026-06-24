message Foo {
  f: Int;
}

contract Test {
  receive(msg: Foo) {
    let x = msg.f;
    msg.f = x + 1;
  }
}