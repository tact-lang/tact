message Foo {
  f: Int;
}

contract Test {
  receive(msg: Foo) {
    let m = Foo { f: 10 };
    m.f = 20;
  }
}