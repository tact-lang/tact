struct LargeMixed {
    a: Int as uint8;
    b: Bool;
    c: Int as int16;
    d: Bool;
    e: String;
    f: Int;
    g: Bool;
    h: String;
    i: Int as uint32;
    j: Bool;
    k: Int;
    l: String;
}

contract TestContract {
    data: LargeMixed;

    init() {
        self.data = LargeMixed{
            a: 1,
            b: false,
            c: -100,
            d: true,
            e: "abc",
            f: 12345678,
            g: false,
            h: "def",
            i: 500000,
            j: true,
            k: 0,
            l: "ghi"
        };
    }
}