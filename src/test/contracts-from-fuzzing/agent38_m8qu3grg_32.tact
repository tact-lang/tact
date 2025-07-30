message Example {
  x: Int = 10
}

contract Test {
  receive(msg: Example) {}
}