message MyAddr {
  a: Address
}

contract Test {
  receive(msg: MyAddr) {
    let addr = msg.a;
  }
}