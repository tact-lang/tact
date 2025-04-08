struct FixedSize {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
}

contract FixedSizeTest {
    data: FixedSize;

    init() {
        self.data = FixedSize{ a:1, b:2, c:3, d:4, e:5 };
    }
}
