struct MaxSeq {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as uint64;
    f: Int as uint128;
    g: Int as uint256;
}
contract MaxTest {
    m: MaxSeq;

    init() {
        self.m = MaxSeq{
            a: 10,
            b: 20,
            c: 30,
            d: 40,
            e: 50,
            f: 60,
            g: 70,
        };
    }
}