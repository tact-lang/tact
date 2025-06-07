fun bar(): Int? {
  return 5;
}

contract Test {
  receive() {
    let x = bar();
  }
}