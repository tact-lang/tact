struct Big {
    a: Int = 1;
    b: Int as uint8 = 2;
    c: Int as int64 = 3;
    d: Int = 4;
    e: Bool = true;
    f: Bool = false;
    g: Int?;
    h: Bool?;
    i: Int = 9;
    j: Int as uint16 = 10;
    k: Bool = true;
}

contract TestContract {
    big: Big;
    init() {
        self.big = Big{
            g: 7,
            h: false
        };
    }
}