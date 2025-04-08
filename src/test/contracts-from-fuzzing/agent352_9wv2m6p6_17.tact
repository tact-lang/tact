struct WithSerializations {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int257;
    d: Int as uint256;
}

contract Test {
    data: WithSerializations;

    init() {
        self.data = WithSerializations{
            a: -12,
            b: 255,
            c: -123456789,
            d: 123456789
        };
    }
}