fun concat(a: String, b: String): String {
  return b;
}

contract Test {
  receive() {
    let s = concat("hello", "world");
  }
}