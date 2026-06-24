struct S {
  f: Int;
}

message M {
  s: S;
}

contract Test {
  receive() {
    // do nothing
  }
}