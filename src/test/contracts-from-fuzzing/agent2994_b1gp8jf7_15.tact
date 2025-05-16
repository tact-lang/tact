struct SerTest {
    a: Int as uint64;
    b: Int as int8;
    c: Int as uint256;
}

contract SerialFormats {
    val: SerTest;

    init() {
        self.val = SerTest{
            a: 1234,
            b: -5,
            c: 999999999999999999,
        };
    }
}