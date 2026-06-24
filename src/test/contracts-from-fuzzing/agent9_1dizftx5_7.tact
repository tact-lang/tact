struct S {
  a: Int;
}

message M {
  b: S;
}

contract Test {
  receive(msg: M) {
    dump(msg.b.a);
  }
}