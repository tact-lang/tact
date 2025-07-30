message M1 {
  a: Int;
  b: Bool;
}

message M2 {
  m: M1;
  x: Int;
}

contract TestContract {
  receive() {}
}