fun test(): Address {
  return address("0:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef");
}

contract Test {
  receive() {
    test();
  }
}