struct CustomSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
}

contract SerializeTest {
    ser: CustomSerialization;

    init() {
        self.ser = CustomSerialization{
            a: 255,
            b: -32000,
            c: 15,
        };
    }
}