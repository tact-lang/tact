struct SerialOpts {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
}

contract SerializationContract {
    s: SerialOpts;

    init() {
        self.s = SerialOpts { a: 1, b: -42, c: 123456789 };
    }
}