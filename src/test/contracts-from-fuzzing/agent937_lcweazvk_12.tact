struct VariousSerialized {
    i1: Int as uint8;
    i2: Int as int16;
    i3: Int as uint32;
    i4: Int as int64;
    i5: Int;
}

contract SerialTest {
    ser: VariousSerialized;

    init() {
        self.ser = VariousSerialized{
            i1: 255,
            i2: -32768,
            i3: 4294967295,
            i4: -9223372036854775808,
            i5: 1234567890,
        };
    }
}