struct Inner {
  val: Int?;
  text: String?;
}

struct Middle {
  i1: Inner;
  i2: Inner;
  flag: Bool?;
}

struct Outer {
  m: Middle;
  number: Int;
}

contract Chain {
  data: Outer;

  init() {
    self.data = Outer{
      m: Middle{
        i1: Inner{ val: null, text: null },
        i2: Inner{ val: 512, text: "Tact" },
        flag: true
      },
      number: -123
    };
  }
}