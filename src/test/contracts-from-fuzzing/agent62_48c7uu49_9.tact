struct Tiny {
  flag1: Int as uint1;
  flag2: Int as int1;
  small: Int as uint3;
  mid: Int as int5;
  normal: Int;
  optSmall: Int?;
}

contract Test9 {
  data: Tiny;
  init() {
    self.data = Tiny{
      flag1:1,
      flag2:-1,
      small:7,
      mid:-7,
      normal:999,
      optSmall:null
    };
  }
}