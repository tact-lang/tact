struct WideInts {
  big: Int as uint256;
  mid: Int as uint128;
  small: Int as uint8;
}

contract TestContract {
  s: WideInts;

  init() {
    self.s = WideInts{
      big: pow(2,255),
      mid: pow(2,127),
      small: 255
    };
  }
}
