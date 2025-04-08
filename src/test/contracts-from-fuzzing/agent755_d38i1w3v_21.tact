struct Numbers {
  a: Int as int64;
  b: Int as uint8;
  c: Int as uint256;
}

contract SerializationFormats {
  nums: Numbers;

  init() {
    self.nums = Numbers{ a: -42, b: 255, c: 1234567890 };
  }
}