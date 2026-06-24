struct Simple {
  a: Int;
}

contract SingleIntField {
  field: Int;

  init() {
    self.field = 1;
  }
}