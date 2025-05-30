struct InnerMost {
  v: String;
  flag: Bool?;
}

struct Inner {
  x: Int;
  im: InnerMost;
}

struct Mid {
  a: Inner;
  b: Bool;
}

struct Outer {
  m: Mid;
  s: String;
  opt: Int?;
}

contract DeepCombo {
  data: Outer;

  init() {
    self.data = Outer{
      m: Mid{
        a: Inner{
          x: 5,
          im: InnerMost{
            v: "deepest",
            flag: true
          }
        },
        b: false
      },
      s: "top",
      opt: null
    };
  }
}