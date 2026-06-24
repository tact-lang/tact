struct DeeplyNestedOptional {
  a: Int?;
  b: Inner?;
}

struct Inner {
  val: Int;
  more: Bool?;
}

contract DeepOptionalFields {
  field: DeeplyNestedOptional;

  init() {
    self.field = DeeplyNestedOptional{
      a: null,
      b: Inner{
        val: 42,
        more: null
      }
    };
  }
}