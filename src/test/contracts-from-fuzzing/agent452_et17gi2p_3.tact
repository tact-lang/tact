struct InnerMost {
  value: Int;
}

struct Middle {
  innerMost: InnerMost;
  flag: Bool;
}

struct Outer {
  middle: Middle;
  note: String;
}

contract DeepNest {
  field: Outer;

  init() {
    self.field = Outer{
      middle: Middle{
        innerMost: InnerMost{
          value: 42,
        },
        flag: false,
      },
      note: "hello",
    };
  }
}