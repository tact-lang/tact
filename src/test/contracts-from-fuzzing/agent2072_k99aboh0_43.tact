struct LongLong {
    a: Int as uint8 = 1;
    b: Int as uint16 = 2;
    c: Int as uint32 = 3;
    d: Int as uint64 = 4;
    e: Int as uint8 = 5;
    f: Int as uint16 = 6;
    g: Int as uint32 = 7;
    h: Int as uint64 = 8;
    i: Int as uint8 = 9;
    j: Int as uint16 = 10;
    k: Int as uint32 = 11;
    l: Int as uint64 = 12;
    m: Int as uint8 = 13;
    n: Int as uint16 = 14;
    o: Int as uint32 = 15;
    p: Int as uint64 = 16;
}

contract ManyMany {
    val: LongLong;

    init() {
        self.val = LongLong{};
    }
}