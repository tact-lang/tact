struct SerializedInts {
  x: Int as uint8;
  y: Int as int16;
  z: Int as uint64;
}

contract SerializationFormats {
  nums: SerializedInts;

  init() {
    self.nums = SerializedInts{ x:5, y:-123, z:9999 };
  }
}