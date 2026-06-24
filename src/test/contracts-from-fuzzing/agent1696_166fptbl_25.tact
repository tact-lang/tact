struct WideMix {
    a: Int as uint4;
    b: Int?;
    c: Int as uint8;
    d: Bool?;
    e: Int as uint12;
    f: String?;
    g: Int as uint16;
    h: Bool;
}

contract WideMixStructTest {
    v: WideMix;

    init() {
        self.v = WideMix{
            a: 3,
            b: null,
            c: 15,
            d: true,
            e: 3000,
            f: null,
            g: 65000,
            h: false
        };
    }
}