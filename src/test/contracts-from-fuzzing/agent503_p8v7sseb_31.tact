struct Data {
  x: Int;
}

contract DeclaredNullOpt {
  d: Data? = null;

  init() {
    self.d = null;
  }
}
