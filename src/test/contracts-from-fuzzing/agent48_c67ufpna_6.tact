struct S {
  a: Int;
}

message M {
  s: S;
}

contract Test {
  receive() {
    let m = M{ s: S{ a: 10 } };
  }
}