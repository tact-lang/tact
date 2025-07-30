struct HasField {
  foo: Int
}

contract Test {
  receive() {
    let h = HasField{foo:1};
    h.foo = 2;
  }
}