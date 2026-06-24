struct ZeroDefaultsLarge {
    a: Int = 0;
    b: Int = 0;
    c: Int = 0;
    d: Int = 0;
    e: Int = 0;
    f: Int = 0;
    g: Int = 0;
    h: Int = 0;
    i: Int = 0;
    j: Int = 0;
}

contract ManyZerosStruct {
    data: ZeroDefaultsLarge;

    init() {
        self.data = ZeroDefaultsLarge{};
    }
}