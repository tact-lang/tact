struct StructWithKnownSerialization {
    a: Int as int32;
    b: Int as uint8;
    c: Int as int64;
}

contract KnownSerializationTest {
    s: StructWithKnownSerialization;

    init() {
        self.s = StructWithKnownSerialization{
            a:1, b:2, c:3
        };
    }
}