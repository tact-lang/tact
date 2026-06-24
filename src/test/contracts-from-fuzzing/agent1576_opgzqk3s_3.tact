struct InnerMost {
  a: Int;
  b: Bool;
}

struct Mid {
  im: InnerMost;
  str: String?;
}

struct Outer {
  m: Mid;
  s: String;
  opt: Bool?;
}

contract DeepNestThree {
  data: Outer;

  init() {
    self.data = Outer{
      m: Mid{
        im: InnerMost{
          a: 1,
          b: true,
        },
        str: null,
      },
      s: "hi",
      opt: null,
    };
  }
}