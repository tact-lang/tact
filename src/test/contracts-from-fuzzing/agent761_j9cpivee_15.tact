struct Sub1 { x: Int }
struct Sub2 { y: Int? }
struct Combo {
  a: Sub1;
  b: Sub2;
  c: Int?;
  d: Bool;
  e: String?;
}
contract NestedStructsOptional {
  s: Combo;

  init() {
    self.s = Combo{
      a: Sub1{ x: 5 },
      b: Sub2{ y: null },
      c: null,
      d: true,
      e: "abc",
    };
  }
}