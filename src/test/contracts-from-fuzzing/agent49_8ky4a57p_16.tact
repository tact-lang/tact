message OnlyDefault {
  a: Int = 1;
  b: Int = 2;
}

contract Test {
  receive() {
    let a: Int = 0;
  }
}