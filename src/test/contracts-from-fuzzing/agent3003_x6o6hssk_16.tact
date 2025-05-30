struct Wide {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as uint128;
    f: Int as uint256;
}

contract SerializationUnsigned {
    s: Wide;

    init() {
        self.s = Wide{
            a: 1, b: 2, c: 3, d: 4, e: 5, f: 6
        };
    }
}
