contract BigFields {
    a: Int = 1;
    b: Int as uint8 = 2;
    c: Int as uint64 = 3;
    d: Int? = null;
    e: Bool = false;
    f: Bool? = true;
    g: Address;
    h: Cell;
    i: String = "hi";
    j: Slice;
    k: Int as int16 = -5;
    l: Int as uint4 = 4;
    m: Int as int257 = 6;
    n: Int as uint1 = 1;

    init() {
        self.g = myAddress();
        self.h = emptyCell();
        self.j = emptyCell().asSlice();
    }

    receive() {
        self.a = 42;
    }
}
