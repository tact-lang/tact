struct Inner {
  a: Int;
  b: Bool;
}

struct Middle {
  inner: Inner;
  str: String;
}

struct Outer {
  middle: Middle;
  txt: String;
}

contract DeepNest {
  val: Outer;
  init() {
    self.val = Outer{
      middle: Middle{
        inner: Inner{ a:99, b:true },
        str:"hi"
      },
      txt:"outer"
    };
  }
}
