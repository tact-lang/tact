struct OptNested {
  inner: Int?;
}

struct Holder {
  field: OptNested?;
}

contract OptionalNestedStructTest {
  storage: Holder;

  init() {
    self.storage = Holder{
      field: OptNested{ inner: 7 }
    };
  }
}