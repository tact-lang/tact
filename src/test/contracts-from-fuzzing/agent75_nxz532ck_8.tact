struct Diverse {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as uint128;
    g: Int as int257;
    h: Bool;
    i: String;
}

contract Test {
    field: Diverse;

    init() {
        self.field = Diverse{
            a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: true, i: "hi"
        };
    }
}