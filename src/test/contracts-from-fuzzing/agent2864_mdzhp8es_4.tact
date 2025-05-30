struct Inner {
  a: Int;
  b: String;
}

struct Middle {
  m1: Int;
  m2: Inner;
  m3: Int?;
}

struct Outer {
  o1: Middle;
  o2: Int;
}

contract DeepStruct {
  state: Outer;

  init() {
    self.state = Outer{
      o1: Middle{
        m1: 7,
        m2: Inner{ a:1, b:"" },
        m3:null
      },
      o2: 42
    };
  }
}