struct HasBool {
  b1: Bool;
  b2: Bool;
  b3: Bool;
}

contract TestBools {
  vals: HasBool;

  init() {
    self.vals = HasBool{ b1: true, b2: false, b3: true };
  }
}