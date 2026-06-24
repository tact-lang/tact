struct IntSerialization {
    a: Int as uint8;
    b: Int as int64;
    c: Int;
}

contract IntSerTest {
    v: IntSerialization;
    
    init() {
        self.v = IntSerialization{
            a: 255,
            b: -42,
            c: 123456789012345678901234567890
        };
    }
}