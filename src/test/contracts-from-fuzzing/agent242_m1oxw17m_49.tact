struct StructWithSerialization {
    a: Int as uint32;
    b: Int as int64;
    c: String;
    d: Bool;
}

contract SerializationTest {
    s: StructWithSerialization;
    init() {
        self.s = StructWithSerialization{
            a: 42,
            b: -123456789,
            c: "data",
            d: true,
        };
    }
}