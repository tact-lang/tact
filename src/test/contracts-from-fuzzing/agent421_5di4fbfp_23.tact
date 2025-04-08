struct SerialFormats { a: Int as uint8; b: Int as int8; c: Int as uint16; d: Int as int16; }

contract SerializeFields {
  data: SerialFormats;

  init() {
    self.data = SerialFormats{ a:1, b:-2, c:3, d:-4 };
  }
}