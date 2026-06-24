struct Foo {
  f: Int;
}

contract Test {
  receive() {
    let m = Foo { f: 10 };
    m.f = 20;
  }
}