fun echo(a: Bool): Bool {
  return a;
}

contract Test {
  receive() {
    echo(false);
  }
}