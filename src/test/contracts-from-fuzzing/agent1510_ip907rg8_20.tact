struct S1 { a: Int; }
struct S2 { s1: S1; }

contract OptionalNestedStruct {
  f: S2?;

  init() {
    self.f = null;
  }
}