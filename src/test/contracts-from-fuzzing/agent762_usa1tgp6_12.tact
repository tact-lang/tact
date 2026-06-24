struct SerializedInts {
  big: Int as int257;
  small: Int as uint4;
  medium: Int as uint64;
}

contract SerializedFields {
  data: SerializedInts;

  init() {
    self.data = SerializedInts{
      big: 123456789,
      small: 7,
      medium: 9876543210
    };
  }
}