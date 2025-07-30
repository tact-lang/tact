struct Inner {
  aa: Int as uint8 = 1;
  bb: String? = null;
  cc: Bool? = null;
}

struct Middle {
  dd: Inner;
  ee: Int as int16 = -5;
  ff: Bool? = null;
}

struct Top {
  gg: Middle;
  hh: Int = 0;
  ii: String = "x";
}

contract TestContract {
  deep: Top;

  init() {
    self.deep = Top{
      gg: Middle{
        dd: Inner{},
        ff: null
      },
      hh: 100,
      ii: "hello"
    };
  }
}