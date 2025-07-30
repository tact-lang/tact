struct Tiny {
  n: Int as uint1;
}

contract TinyWrap {
  t: Tiny;
  init() {
    self.t = Tiny{n: 1};
  }
}
