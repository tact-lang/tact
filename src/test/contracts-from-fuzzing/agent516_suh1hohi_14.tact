struct Boo {
  x: Int?;
  y: Bool?;
}

contract InitNulls {
  p: Boo;

  init() {
    self.p = Boo{ x: null, y: null };
  }
}
