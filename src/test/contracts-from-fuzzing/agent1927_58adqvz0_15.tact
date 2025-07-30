struct SerialOpts {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
}

contract SerializationOptsTest {
    data: SerialOpts;

    init() {
        self.data = SerialOpts{ a:255, b:64, c:256 };
    }
}