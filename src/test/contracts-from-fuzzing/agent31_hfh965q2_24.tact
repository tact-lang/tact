struct OptionNested {
 inner: Int?;
}

contract Test {
  a: OptionNested?;

  init() {
    self.a = null;
  }
}