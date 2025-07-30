struct InnerMost {
  flag: Bool;
}

struct Inner {
  value: Int;
  optInnerMost: InnerMost?;
}

struct Mid {
  inner: Inner;
}

struct Outer {
  mid: Mid;
  message: String;
}

contract ComplexNestedOptionals {
  data: Outer;

  init() {
    self.data = Outer{
      mid: Mid{
        inner: Inner{
          value: 123,
          optInnerMost: null,
        }
      },
      message: "Testing",
    };
  }

  receive() {}
}