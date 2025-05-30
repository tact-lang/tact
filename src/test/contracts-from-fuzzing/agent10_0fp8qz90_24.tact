message X {
  a: Int;
}

message Y {
  b: Int;
}

contract TestContract {
  receive(msg: X) {}
  receive(msg: Y) {}
}