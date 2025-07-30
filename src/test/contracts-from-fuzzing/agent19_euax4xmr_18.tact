struct Deep {
  small: Int as uint4;
  tiny: Int as int3;
  flag: Bool;
}

struct Middle {
  foo: Deep;
  bar: Int as uint8;
}

contract Test {
  data: Middle;

  init() {
    self.data = Middle{
      foo: Deep{
        small: 15,   // max uint4
        tiny: 3,     // max int3
        flag: true
      },
      bar: 255      // max uint8
    };
  }
}