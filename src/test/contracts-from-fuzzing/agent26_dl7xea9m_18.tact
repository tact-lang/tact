struct SerialTest {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int;
    flag: Bool;
}

contract Test {
    s: SerialTest;
    
    init() {
        self.s = SerialTest{
            a: 1,
            b: -5,
            c: 123456,
            d: -9999,
            flag: true
        };
    }
}