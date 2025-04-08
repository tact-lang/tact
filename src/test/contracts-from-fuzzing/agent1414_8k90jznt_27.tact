struct DeepMega {
    aa: Int as uint8;
    bb: Bool;
    cc: String?;
    dd: Inner1;
    ee: Inner2?;
    ff: Int as coins;
}

struct Inner1 {
    a: Int?;
    b: Bool;
    c: String;
}

struct Inner2 {
    m: Int as uint32;
    n: String?;
}

contract MegaStructTest {
    mega: DeepMega;

    init() {
        self.mega = DeepMega {
            aa: 7,
            bb: true,
            cc: null,
            dd: Inner1 { a: null, b: false, c: "X" },
            ee: null,
            ff: 1234567890
        };
    }
}