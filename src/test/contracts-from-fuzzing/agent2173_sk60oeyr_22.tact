struct PaddedInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint64;
    d: Int as int256;
}
contract SerializeEdge {
    s: PaddedInts;

    init() {
        self.s = PaddedInts{ a:1, b:2, c:3, d:4 };
    }
}