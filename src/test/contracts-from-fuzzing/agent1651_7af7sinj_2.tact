struct Inner {
  a: Int;
  b: Bool?;
}

struct Middle {
  inner: Inner;
  note: String;
}

struct Outer {
  middle: Middle;
  count: Int?;
}

contract DeepNested {
  data: Outer;

  init() {
    self.data = Outer{
      middle: Middle{
        inner: Inner{
          a: 5,
          b: true,
        },
        note: "hi",
      },
      count: null,
    };
  }
}