message HasReservedWordField {
  contract: Int;
}

contract Test {
  receive() {
    let m = HasReservedWordField{contract: 1};
  }
}