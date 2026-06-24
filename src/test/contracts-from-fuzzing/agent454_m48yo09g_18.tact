struct S { x: Int; }

contract OptionalAtTop {
  sopt: S?;
  init() {
    self.sopt = null;
  }
}