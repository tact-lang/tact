struct OptionalNested {
  inner: Int?;
}

struct Wrapper {
  nested: OptionalNested;
}

contract OptionalInNestedStruct {
  wrapper: Wrapper;

  init() {
    self.wrapper = Wrapper{
      nested: OptionalNested{
        inner: null,
      },
    };
  }
}