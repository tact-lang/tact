struct CustomSerialization {
    u4: Int as uint4;
    i13: Int as int13;
    u200: Int as uint200;
}

contract SerializedStructTest {
    ser: CustomSerialization;

    init() {
        self.ser = CustomSerialization{
            u4:5,
            i13:6,
            u200:7
        };
    }
}