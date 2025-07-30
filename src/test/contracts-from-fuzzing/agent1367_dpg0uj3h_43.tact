struct S { a: Int?; }

contract InitializePartial {
  s: S;

  init() {
    self.s = S{ a: null };
  }
}