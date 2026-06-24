// persistent state with multiple nested structs and many optional Ints
struct Inn {
  x: Int?;
  y: Int?;
}

struct Mid {
  i1: Inn?;
  i2: Inn?;
}

contract OptMixDeep {
  m: Mid;

  init() {
    self.m = Mid{
      i1: Inn{ x:1, y:null },
      i2: null
    };
  }
}
