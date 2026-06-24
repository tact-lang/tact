struct BigStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as int257;
    f: Int as uint1;
    g: Bool;
    h: String;
}

contract TestContract {
    s: BigStruct;
    init() {
        self.s = BigStruct{
            a: 1,
            b: -2,
            c: 3,
            d: -4,
            e: 5,
            f: 1,
            g: true,
            h: "yo"
        };
    }
}