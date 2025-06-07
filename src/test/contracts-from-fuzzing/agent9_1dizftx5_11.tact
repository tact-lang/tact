message M {
  a: Int;
}

contract Test {
  receive() {
    let m = M { a: 7 };
    dump(m.a);
  }
}