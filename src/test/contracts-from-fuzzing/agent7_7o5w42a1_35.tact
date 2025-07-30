message CapitalField {
  Foo: Int;
}

contract Test {
  receive() {
    let m = CapitalField { Foo: 7 };
  }
}