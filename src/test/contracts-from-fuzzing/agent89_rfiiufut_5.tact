struct Inner {
  value: Int?;
}

struct Outer {
  optionalInner: Inner?;
}

contract OptionalNested {
  storage: Outer;

  init() {
    self.storage = Outer {
      optionalInner: Inner { value: 5 }
    };
  }
}
