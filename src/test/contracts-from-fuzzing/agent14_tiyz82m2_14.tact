struct Inner1 { x: Int }
struct Inner2 { y: Bool }
struct Combo {
  a: Inner1;
  b: Inner2;
}
contract NestedCombo {
  combo: Combo;

  init() {
    self.combo = Combo{
      a: Inner1{ x: 42 },
      b: Inner2{ y: true }
    };
  }
}