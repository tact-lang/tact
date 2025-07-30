struct C {
  str: String;
}

contract Test {
  obj: C;

  init() {
    self.obj = C{str:"hello"};
  }
}
