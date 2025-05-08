message AddressWrap {
  inner: Address;
}

contract TestContract {
  receive(msg: AddressWrap) {}
}