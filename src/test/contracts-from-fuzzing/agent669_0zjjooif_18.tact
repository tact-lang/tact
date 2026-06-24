struct HasUint {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
}

contract UintSerialization {
    data: HasUint;

    init() {
        self.data = HasUint{ a:255, b:65535, c:4294967295 };
    }
}