struct Mixed {
  i: Int?;
  b: Bool?;
  s: String?;
}

contract OptNulls {
  store: Mixed;

  init() {
    self.store = Mixed{ i: null, b: null, s: null };
  }
  receive() { dump(self.store.b); }
}