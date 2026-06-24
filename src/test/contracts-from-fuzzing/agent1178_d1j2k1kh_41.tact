// switch ordering optionals and required
struct MixOrder {
  a: Int?;
  b: Int;
  c: Int?;
  d: Int;
}

contract Test {
  m: MixOrder;
  init() {
    self.m = MixOrder{ a:null, b:1, c:null, d:2 };
  }
}