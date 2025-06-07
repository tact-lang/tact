struct SDeep1 { v: Int; }
struct SDeep2 { a: SDeep1; }
struct SDeep3 { b: SDeep2; }
struct SDeep4 { c: SDeep3; }

contract FourNested {
  deep: SDeep4;

  init() {
    self.deep = SDeep4{ c: SDeep3{ b: SDeep2{ a: SDeep1{ v: 12 } } } };
  }
}
