struct HasString {
  s: String;
}

contract PersistentString {
  s: HasString;

  init() {
    self.s = HasString{ s: "test string" };
  }

  receive() {
    let _ = self.s.s;
  }
}
