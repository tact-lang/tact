struct NumTest {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int257;
    d: Int as uint256;
    e: Int as int16;
    f: Int as uint4;
}

contract TestContract {
    numbers: NumTest;

    init() {
        self.numbers = NumTest{
            a: -128,
            b: 255,
            c: 123456789012345678901234567890,
            d: 123456789012345678901234567890,
            e: -32000,
            f: 15,
        };
    }
}