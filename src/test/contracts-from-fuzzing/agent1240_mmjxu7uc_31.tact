contract EdgeBitWidths {
    top: Top;

    init() {
        self.top = Top{
            mid: Mid{
                bigNeg: -1234567890123456789012345678901234567890,
                bigPos: 1234567890123456789012345678901234567890
            },
            flag: true
        };
    }
}

struct Top {
    mid: Mid;
    flag: Bool;
}

struct Mid {
    bigNeg: Int as int257;
    bigPos: Int as uint256;
}
