struct OddOrder {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool?;
    g: Int?;
    h: Bool;
}

contract TestOddOrder {
    so: OddOrder;

    init() {
        self.so = OddOrder{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: 2,
            f: null,
            g: 3,
            h: true,
        };
    }
}