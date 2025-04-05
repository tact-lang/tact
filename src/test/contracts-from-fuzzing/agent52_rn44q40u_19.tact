message Foo {
  f: Int;
}

contract Test {
  receive(msg: Foo) {
    let m = Foo { f: msg.f };
  }
}