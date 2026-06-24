fun foo(x: Int): Int {
  return x + 1;
}

contract Test {
    receive() {
        foo(-1);
    }
}