message Test {
  a: Int;
  b: Int = 5;
}

contract TestContract {
  receive(msg: Test) {}
}