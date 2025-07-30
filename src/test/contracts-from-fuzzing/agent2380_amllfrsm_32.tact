struct Weird {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as uint16;
    d: Int? as uint8;
    e: Int? as int16;
    f: Int as int64;
    g: Int as uint32;
}

contract TestContract {
    stuff: Weird;
    init() {
        self.stuff = Weird{
            a: 1,
            b: 255,
            c: 65535,
            d: null,
            e: null,
            f: -1000000,
            g: 4294967295
        };
    }
}