struct HasEmpty {
  t1: String = "";
  t2: String = "";
}

contract EmptyStrings {
  data: HasEmpty;

  init() {
    self.data = HasEmpty{};
  }

  receive() { dump(0); }
}