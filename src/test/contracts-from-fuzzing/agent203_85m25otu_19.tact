contract TestContract {
    a: Int;
    b: Bool;
    c: Int as uint16;
    d: Int as int64;
    e: Address;
    f: Cell;
    g: Slice;
    h: String;
    i: Int?;
    j: Bool?;
    k: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = 65535;
        self.d = -12345678;
        self.e = myAddress();
        self.f = emptyCell();
        self.g = emptyCell().asSlice();
        self.h = "hello";
        self.i = null;
        self.j = false;
        self.k = null;
    }
}