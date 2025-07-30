contract HugeFlatFields {
    a: Int = -1;
    b: Int as int8 = 127;
    c: Int as uint8 = 255;
    d: Int as int16 = -32768;
    e: Int as uint16 = 65535;
    f: Int as int32 = -2147483648;
    g: Int as uint32 = 4294967295;
    h: Int as int64 = -9223372036854775808;
    i: Int as uint64 = 18446744073709551615;
    j: Bool = true;
    k: Bool = false;
    l: Address;
    m: String = "hello";
    n: Cell;
    o: Slice;
    p: String? = null;
    q: Int? = null;
    r: Bool? = null;
    s: Address? = null;
    t: Cell? = null;

    init() {
        self.l = myAddress();
        self.n = emptyCell();
        self.o = emptyCell().asSlice();
        self.q = 42;
        self.r = true;
        self.s = myAddress();
        self.t = emptyCell();
        self.p = "hi";
    }

    receive() {
        self.a = 1;
    }
}