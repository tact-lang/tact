struct OptTestInner {
  x: Int;
  y: Bool;
}

struct OptTest {
  opt: OptTestInner?;
}

contract OptionalField {
  myfield: OptTest;

  init() {
    self.myfield = OptTest{ opt: null };
  }
}
