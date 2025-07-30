struct NullableDeeps {
  foo: Int?;
  bar: String?;
  nested: S?;
}

struct S {
  value: Int;
}

contract NullableDeepsContract {
  val: NullableDeeps;

  init() {
    self.val = NullableDeeps{
      foo: null,
      bar: null,
      nested: null
    };
  }
}
