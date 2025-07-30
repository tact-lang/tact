struct Inner {
  a: Int;
  b: Bool;
}

struct Middle {
  inner1: Inner;
  inner2: Inner;
}

struct Outer {
  middle1: Middle;
  middle2: Middle;
}

contract TestMultiNest {
  data: Outer;
  init() {
    self.data = Outer{
      middle1: Middle{ inner1: Inner{ a:1, b:true }, inner2: Inner{ a:2, b:false } },
      middle2: Middle{ inner1: Inner{ a:3, b:true }, inner2: Inner{ a:4, b:false } }
    };
  }
}