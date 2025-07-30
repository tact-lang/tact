struct S {
  a: Int;
}

message M {
  a: Int;
}

contract Test {
  receive(msg: M) {
    let s = S { a: msg.a };
  }
}