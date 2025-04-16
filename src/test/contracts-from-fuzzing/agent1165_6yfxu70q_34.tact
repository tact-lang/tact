struct MixSerialization {
    i8: Int as uint8;
    si8: Int as int8;
    i16: Int as uint16;
    si16: Int as int16;
    i32: Int as uint32;
    si32: Int as int32;
}

contract MixSerializeFields {
    ser: MixSerialization;

    init() {
        self.ser = MixSerialization{ i8: 1, si8: -1, i16: 2, si16: -2, i32: 3, si32: -3 };
    }
}
