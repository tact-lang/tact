trait SomeTrait {
  a: Int;
}

contract ImplWithInit with SomeTrait {
  a: Int;
  init() {
    self.a = 5;
  }
}
