contract BoolTest {
  a: Bool;
  b: Bool = true;
  c: Bool;

  init() {
    self.a = false;
    self.c = false;
  }

  receive() {
    let _ = self.b;
  }
}
