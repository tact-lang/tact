struct A { a: Int }
struct B { b: Bool }
struct C { c: String }
struct D { d: Slice }
struct E { e: Cell }

struct Combo {
  a: A;
  b: B;
  c: C;
  d: D;
  e: E;
}

contract TestContract {
  combo: Combo;

  init() {
    self.combo = Combo{
      a: A{a:1},
      b: B{b:true},
      c: C{c:"txt"},
      d: D{d:emptyCell().asSlice()},
      e: E{e:emptyCell()},
    };
  }
}
