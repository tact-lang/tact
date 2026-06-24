struct NullableNest {
  a: Int?;
  b: NullableNest2?;
}
struct NullableNest2 {
  c: Int?;
  d: String?;
}
contract NullableNestContract {
  nn: NullableNest;
  init() {
    self.nn = NullableNest{
      a: 1,
      b: NullableNest2{
        c: 2,
        d: "hi"
      }
    };
  }
}