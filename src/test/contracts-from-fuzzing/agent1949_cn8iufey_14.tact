struct SerialTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint16;
    d: Int as int64;
    e: Int as uint64;
    f: Int as int257;
}

contract SerializeFields {
    sf: SerialTest;

    init() {
        self.sf = SerialTest{
            a: 1, b: -2, c: 3, d: -4, e: 5, f: -6
        };
    }
}
