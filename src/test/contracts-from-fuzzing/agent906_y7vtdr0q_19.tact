struct HighBits {
    a: Int as uint256;
    b: Int as int257;
    c: Int;
}

contract MaxIntegers {
    data: HighBits;

    init() {
        self.data = HighBits{
            a: 100,
            b: -200,
            c: 50,
        };
    }
}