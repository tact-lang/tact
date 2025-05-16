struct Numbers {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint256;
}

contract NumberRanges {
    data: Numbers;
    init() {
        self.data = Numbers{ a:1, b:2, c:3, d:4 };
    }
}