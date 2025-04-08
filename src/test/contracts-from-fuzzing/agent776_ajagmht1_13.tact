struct SerialTest {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint4;
    d: Bool;
}

contract SerialContract {
    vals: SerialTest;
    init() {
        self.vals = SerialTest{
            a: 5,
            b: -12345,
            c: 7,
            d: true
        };
    }
}
