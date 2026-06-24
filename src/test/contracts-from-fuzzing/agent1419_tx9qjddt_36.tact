struct StructSerialize {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int;
}

contract SerializeStruct {
    s: StructSerialize;
    init() {
        self.s = StructSerialize{
            a:255, b:-30000, c:1234567890, d:-1234567890
        };
    }
}