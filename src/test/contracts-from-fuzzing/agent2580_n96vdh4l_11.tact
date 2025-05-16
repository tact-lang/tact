struct S1 {
  a: Int;
  b: Bool;
}
struct S2 {
  x: S1;
  y: S1;
}
contract DoubleStruct {
  d: S2;

  init() {
    self.d = S2{
      x: S1{ a: 1, b: true },
      y: S1{ a: 2, b: false }
    };
  }
}