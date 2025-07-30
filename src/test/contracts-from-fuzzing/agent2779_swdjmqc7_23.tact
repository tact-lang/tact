struct IntFormats {
    s257: Int as int257;
    u256: Int as uint256;
    u32: Int as uint32;
}

contract DifferentSizeInts {
    ff: IntFormats;
    init() {
        self.ff = IntFormats{
            s257: 0,
            u256: 1,
            u32: 2
        };
    }
}