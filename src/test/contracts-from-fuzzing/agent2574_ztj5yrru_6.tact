struct Inner {
  n: Int;
}

struct Middle {
  inner: Inner;
}

struct Outer {
  middle: Middle;
}

contract UltraNested {
  multi: Outer;

  init() {
    self.multi = Outer{
      middle: Middle{
        inner: Inner{ n: 123 }
      }
    };
  }
}