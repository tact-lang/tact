message SingleField { val: Int; }

contract Test {
  receive() {
    let m = SingleField { val: 123 };
  }
}