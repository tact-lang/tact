struct BigNested {
  d1: Int;
  d2: Int;
  d3: Int;
  d4: Int;
  d5: Int;
  d6: Int;
  d7: Int;
  d8: Int;
}

struct Middle {
  n1: BigNested;
  n2: BigNested;
}

contract WideNested {
  f1: Middle;

  init() {
    let val = BigNested{ d1:1,d2:2,d3:3,d4:4,d5:5,d6:6,d7:7,d8:8 };
    self.f1 = Middle { n1: val, n2: val };
  }
}