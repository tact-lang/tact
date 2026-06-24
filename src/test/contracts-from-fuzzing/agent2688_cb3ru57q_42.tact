struct LowerBounds {
  min1: Int as int1;
  min4: Int as int4;
  min8: Int as int8;
}

contract LowerLimits {
  vals: LowerBounds;
  init() {
    self.vals = LowerBounds{
      min1: -1,
      min4: -8,
      min8: -128
    };
  }
}