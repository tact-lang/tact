struct S123 {
    one: Int as uint8;
    two: Int as uint16;
    three: Int as uint32;
}

contract SerializeMix {
    s: S123;
    init() {
        self.s = S123{one: 255, two: 65535, three: 4294967295};
    }
}