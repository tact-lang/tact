struct Detail {
  num: Int = 1;
}

contract Test {
  info: Detail? = null;

  receive() {
    self.info = Detail{num: 999};
  }
}