message M {
  m: map<Int, Int>
}

contract Test {
  receive(msg: M) {}
}