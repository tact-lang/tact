fun bar(x: Int?): Int {
  if (x == null) {
    return 0;
  }
  return x!!;
}

contract Test {
  receive() {
    let y = bar(null);
  }
}