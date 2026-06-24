struct BigAttrs {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int64;
    d: Int as uint128;
    e: Int as int257;
}

contract SerializeTest {
    s: BigAttrs;

    init() {
        self.s = BigAttrs{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5
        };
    }
}