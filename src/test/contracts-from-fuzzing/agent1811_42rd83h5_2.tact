struct OptionalNested {
  maybeInner: Inner?;
}

struct Inner {
  value: Int?;
}

contract TestOptNested {
  data: OptionalNested;

  init() {
    self.data = OptionalNested{
      maybeInner: Inner{
        value: null
      }
    };
  }
}
