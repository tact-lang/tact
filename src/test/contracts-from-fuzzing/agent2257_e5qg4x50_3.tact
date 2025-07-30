struct InnerMost {
  x: Int;
  y: Bool;
}

struct Inner {
  nested: InnerMost;
  text: String;
}

struct Mid {
  field: Int?;
  inner: Inner;
}

struct Outer {
  mid: Mid;
  flag: Bool;
  bigNum: Int;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{
      mid: Mid{
        field: null,
        inner: Inner{
          nested: InnerMost{
            x: 42,
            y: true,
          },
          text: "deep",
        },
      },
      flag: false,
      bigNum: 999,
    };
  }
}