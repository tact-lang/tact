struct S {
  a: Int
}

message M {
  b: S
}

contract Test {
  receive(msg: M) {
    let x = msg.b.a;
  }
}