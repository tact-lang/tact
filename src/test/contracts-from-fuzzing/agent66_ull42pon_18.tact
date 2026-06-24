// Deep struct chain with serialization and optional edge
struct A { a: Int as uint8; }
struct B { b: A; }
struct C { c: B; }
struct D { d: C; opt: String?; }
contract Chain {
  val: D;
  init() {
    self.val = D{
      d: C{ c: B{ b: A{ a: 4 } } },
      opt: null,
    };
  }
}