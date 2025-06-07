message M {
  opt: Int?
}

contract Test {
  receive(msg: M) {}
}