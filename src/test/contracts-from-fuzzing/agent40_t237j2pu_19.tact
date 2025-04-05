message M {
  a: Int;
}

struct S {
  b: Int;
}

contract Test {
  receive(msg: M) {
    let s = S { b: msg.a };
  }
}