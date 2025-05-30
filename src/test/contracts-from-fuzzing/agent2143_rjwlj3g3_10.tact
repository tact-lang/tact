struct MixOptionalDefault {
  foo: Int = 42;
  bar: Bool?;
}

contract OptionalDefaultField {
  data: MixOptionalDefault;

  init() {
    self.data = MixOptionalDefault{foo: 1, bar: null};
  }
}