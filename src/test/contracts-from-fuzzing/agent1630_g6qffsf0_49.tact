struct S1 { v: Int; }
struct S2 { s: S1?; }
contract OptionalS2 {
  f: S2?;

  init() {
    self.f = null;
  }
}