struct OptionalNested {
  inner: String?;
}

struct Wrapper {
  wrap: OptionalNested?;
}

contract OptionalOfStruct {
  nestedWrap: Wrapper;

  init() {
    self.nestedWrap = Wrapper {
      wrap: OptionalNested{
        inner: "hello"
      }
    };
  }
}
