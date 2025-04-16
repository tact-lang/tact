struct X { val: Int?; }

contract OptionalSetter {
  d: X;
  init() {
    self.d = X{ val: null };
  }
}