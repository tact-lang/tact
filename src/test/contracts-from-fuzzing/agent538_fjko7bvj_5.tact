struct SOpt {
  x: Int?;
  b: Bool?;
}

contract OptStructContract {
  s: SOpt;

  init() {
    self.s = SOpt{ x: null, b: true };
  }
}
