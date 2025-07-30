struct HasReservedWordField {
  contract: Int;
}

contract Test {
  receive() {
    let s = HasReservedWordField{contract: 1};
  }
}