message Foo {
  m: map<Int, Int>;
}

contract Test {
  receive(msg: Foo) {
    let v = msg.m.get(1);
  }
}