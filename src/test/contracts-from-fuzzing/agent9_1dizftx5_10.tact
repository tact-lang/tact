message M {
  a: Int;
}

contract Test {
  receive(msg: M) {
    let m: M = msg;
    dump(m.a);
  }
}