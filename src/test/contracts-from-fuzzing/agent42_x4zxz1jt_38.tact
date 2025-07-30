struct X {
  b: Bool
}

message Y {
  x: X
}

contract Test {
  receive() {}
}