struct Reserved {
  contract: Address;
}

contract Test {
  receive() {
    let addr: Address = address("0:0000000000000000000000000000000000000000000000000000000000000000");
    let x: Reserved = Reserved { contract: addr };
  }
}