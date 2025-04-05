message M {
  v: Int?;
}

contract Test {
  receive(m: M) {
    if (m.v != null) {
      let x = m.v;
    }
  }
}