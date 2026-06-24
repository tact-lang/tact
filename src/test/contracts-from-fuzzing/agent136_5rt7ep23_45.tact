struct SerializeMix {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
}

contract SerializationSizes {
    s: SerializeMix;

    init() {
        self.s = SerializeMix{ a:100, b:-30000, c:123456, d:-9876543210 };
    }
}