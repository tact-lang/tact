fun foo(x: Bool): Int {
  if (x) {
    return 1;
  } else {
    return 0;
  }
}

contract Test {
  receive() {
    let y = foo(false);
  }
}