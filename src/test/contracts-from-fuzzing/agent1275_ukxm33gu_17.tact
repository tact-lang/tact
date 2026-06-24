struct MixOptNested {
  inner: Inner?;
  val: Int;
}

struct Inner {
  foo: Bool;
  bar: String?;
}

contract OptionalNestedFields {
  s: MixOptNested;

  init() {
    self.s = MixOptNested{
      inner: null,
      val: 42
    };
  }
}