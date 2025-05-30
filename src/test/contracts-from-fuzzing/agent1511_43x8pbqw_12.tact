struct SerialTest {
    a: Int as int64;
    b: Int as uint4;
    c: Int as uint256;
    d: Int; // default int257
}

contract SerialTestContract {
    stor: SerialTest;

    init() {
        self.stor = SerialTest{
            a: 42,
            b: 8,
            c: 256,
            d: -1,
        };
    }
}