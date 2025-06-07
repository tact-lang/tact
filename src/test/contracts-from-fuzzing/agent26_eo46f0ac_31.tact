message MyMessage {
  address: Address;
}

contract Test {
  receive(msg: MyMessage) {
    let addr = msg.address;
  }
}