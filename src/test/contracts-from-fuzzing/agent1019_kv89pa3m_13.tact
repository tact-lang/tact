struct Numbers {
  a: Int as uint4;
  b: Int as int8;
  c: Int as uint16;
}

contract SerializedFields {
  nums: Numbers;

  init() {
    self.nums = Numbers{ a: 5, b: -7, c: 1000 };
  }
}
