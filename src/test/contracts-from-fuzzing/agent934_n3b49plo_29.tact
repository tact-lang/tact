struct S { x: Int }

contract OptionalStructInit {
  s: S?;
  init() {
    self.s = null;
  }
}