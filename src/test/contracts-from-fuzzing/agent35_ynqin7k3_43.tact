struct InnerMost {
    x: Int as uint8;
    y: Bool?;
}

struct Middle {
    val1: Int as int16;
    val2: InnerMost?;
}

struct HugeMix {
  a: Middle;
  b: Middle;
  
  c1: Int;
  c2: Int;
  c3: Int;
  c4: Int;
  c5: Int;
  c6: Int;
  c7: Int;
  c8: Int;
  c9: Int;
  c10: Int;

  d1: Bool?;
  d2: Bool?;
  d3: Bool?;
  d4: Bool?;
  d5: Bool?;
}

contract StressMix {
  data: HugeMix;

  init() {
    self.data = HugeMix{
      a: Middle{ val1: 3, val2: null },
      b: Middle{ val1: 5, val2: null },
      c1:1,c2:2,c3:3,c4:4,c5:5,c6:6,c7:7,c8:8,c9:9,c10:10,
      d1:null,d2:null,d3:null,d4:null,d5:null
    };
  }
}