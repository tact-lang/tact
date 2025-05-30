fun bar(): Int? {
  return null;
}

contract Test {
  receive() {
    let x = bar();
  }
}