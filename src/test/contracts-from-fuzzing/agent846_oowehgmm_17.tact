struct Mixed {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: Bool?;
    f: Address;
    g: Int as uint32;
    h: Bool;
    i: Int as int64;
}

contract Test {
    m: Mixed;

    init() {
        self.m = Mixed{
            a: 10,
            b: true,
            c: myAddress(),
            d: null,
            e: false,
            f: myAddress(),
            g: 123456,
            h: false,
            i: -123456789
        };
    }
}