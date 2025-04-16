struct S1 {
  x: Int?;
  y: String;
}

struct S2 {
  inner: S1?;
}

contract OptionalStructField {
  field: S2;

  init() {
    self.field = S2{
      inner: null
    };
  }
}
