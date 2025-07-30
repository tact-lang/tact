// persistent optional struct with default null, containing optional primitives
struct S {
  a: Int?;
  b: Bool?;
  s: String?;
}

contract OptionalsDefault {
  x: S?;
  init() {
    self.x = null;
  }
}
