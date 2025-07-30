struct StressPrims {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as coins;
    g: Int as uint4;
    h: Int as uint8;
    i: Int as uint16;
    j: Int as uint32;
    k: Int as int64;
    l: Int as coins;
}

contract StressPrimSer {
    prims: StressPrims;

    init() {
        self.prims = StressPrims{
            a: 1, b: 2, c: 3, d: 4, e: 5, f: ton("1"),
            g: 6, h: 7, i: 8, j: 9, k: 10, l: ton("2")
        };
    }
}