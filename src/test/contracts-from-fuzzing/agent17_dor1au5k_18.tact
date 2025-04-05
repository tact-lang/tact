fun foo(): Int? {
  return null;
}

contract Test {
  receive() {
    let v = foo();
  }
}