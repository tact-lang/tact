struct IntWithVariousSizes {
    a: Int as uint2;
    b: Int as uint3;
    c: Int as uint8;
    d: Int as int5;
    e: Int as int16;
    f: Int; // default 257 bits
}

contract IntSerializationFormats {
    val: IntWithVariousSizes;
    init() {
      self.val = IntWithVariousSizes{
        a: 2,
        b: 7,
        c: 255,
        d: -15,
        e: 12345,
        f: 1234567890,
      };
    }
}