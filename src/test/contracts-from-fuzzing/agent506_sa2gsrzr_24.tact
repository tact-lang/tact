struct NullableDeep {
  val: Int?;
}

struct MiddleDeep {
  inner: NullableDeep?;
}

contract ComplexNestedOpt {
  field: MiddleDeep?;

  init() {
    self.field = MiddleDeep{
      inner: NullableDeep{
        val: null
      }
    };
  }
}