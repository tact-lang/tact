message WithDefault {
  x: Int = 7;
}

contract Test {
  receive() {
    WithDefault{x: 10};
  }
}