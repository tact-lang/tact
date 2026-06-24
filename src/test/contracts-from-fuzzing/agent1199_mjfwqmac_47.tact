struct MaxBits {
  big: Int as int257;
  small: Int as uint1;
}

contract Test47 {
  m: MaxBits;

  init() {
    self.m = MaxBits{big:1, small:1};
  }
}