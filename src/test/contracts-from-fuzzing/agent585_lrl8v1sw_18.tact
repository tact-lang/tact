struct X { x: Int }
struct Combo { a: Int; optX: X? }

contract Test {
  c: Combo;
  init() {
    self.c = Combo{ a: 5, optX: null };
  }
}