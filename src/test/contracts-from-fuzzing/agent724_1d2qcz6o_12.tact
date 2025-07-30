struct IntFormats {
    a: Int as uint8;
    b: Int as int64;
    c: Int as int257;
    d: Int as uint256;
}

contract TestContract {
    ints: IntFormats;

    init() {
        self.ints = IntFormats{ a:1, b:2, c:3, d:4 };
    }
}