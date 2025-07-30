struct SerializationFormats {
    i1: Int as int8;
    i2: Int as uint8;
    i3: Int as int64;
    i4: Int as uint64;
    b1: Bool;
    s1: String;
}

contract SerializeTest {
    data: SerializationFormats;

    init() {
        self.data = SerializationFormats{
            i1: -8,
            i2: 255,
            i3: 123456,
            i4: 123456789,
            b1: true,
            s1: "serialization",
        };
    }
}