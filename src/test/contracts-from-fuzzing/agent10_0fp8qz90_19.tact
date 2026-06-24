message M {
  s: Slice;
}

contract TestContract {
  receive(msg: M) {}
}