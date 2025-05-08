struct Ints {
  smallPos: Int as uint8;
  smallNeg: Int as int8;
  big: Int as uint256;
}

contract Ranges {
  data: Ints;

  init() {
    self.data = Ints{
      smallPos: 255,
      smallNeg: -128,
      big: 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF,
    };
  }
}