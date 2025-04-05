message HasAddress {
  addr: Address;
}

contract Test {
  receive(msg: HasAddress) {
    let a = msg.addr;
  }
}