message M {
  s: Int;
}

contract Test {
  receive(m: M) {
    let x = m.s;
  }
}