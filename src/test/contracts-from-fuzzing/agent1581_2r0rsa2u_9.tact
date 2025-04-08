struct Inner {
  flag: Bool;
}

struct Middle {
  i: Inner;
}

struct Outer {
  m: Middle;
}

contract ExplicitInit {
  data: Outer;

  init() {
    self.data = Outer{
      m: Middle{
        i: Inner{
          flag: true,
        },
      },
    };
  }
}