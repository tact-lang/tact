message M {
  s: String;
}

contract Test {
  receive(m: M) {
    m.s = "hi";
  }
}