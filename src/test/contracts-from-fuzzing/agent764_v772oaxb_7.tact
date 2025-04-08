struct Mismatch {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int;
    e: Int as int257;
}

contract SerializationMix {
    data: Mismatch;

    init() {
        self.data = Mismatch{
            a: 5,
            b: -42,
            c: 999,
            d: 123456789,
            e: -1
        };
    }
}