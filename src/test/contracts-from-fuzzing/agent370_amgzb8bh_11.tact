struct S1 {
  a: Int;
  b: Bool?;
}
struct S2 {
  x: S1;
  y: S1?;
}
contract OptionalNestedStructs {
  s: S2;

  init() {
    self.s = S2{
      x: S1{a: 10, b: null},
      y: null
    };
  }
}