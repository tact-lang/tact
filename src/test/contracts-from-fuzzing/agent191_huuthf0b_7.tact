struct VariousSerialization {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint64;
    e: Int as int257;
    f: Int as uint256;
}

contract TestContract {
    data: VariousSerialization;

    init() {
        self.data = VariousSerialization{
            a: -5, b: 250, c: 1234567890, d: 1234567890,
            e: -1234567890123456789012345, f: 1234567890123456789012345
        };
    }
}