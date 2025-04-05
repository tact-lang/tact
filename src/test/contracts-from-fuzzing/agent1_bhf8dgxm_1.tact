fun foo(): Int {
  return 42;
}

contract Test {
    receive() {
        foo();
    }
}
