struct Tricky {
  a: Int?;
  b: Bool?;
}

contract Edge {
  tricky: Tricky;

  init() {
    self.tricky = Tricky{ a: null, b: null };
  }
}