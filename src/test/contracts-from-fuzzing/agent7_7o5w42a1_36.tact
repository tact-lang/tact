message LowerField {
  foo: Int;
}

contract Test {
  receive() {
    let m = LowerField { foo: 7 };
  }
}