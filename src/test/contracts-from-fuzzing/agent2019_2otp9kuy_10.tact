// Long list of fields including optionals, primitives and strings
contract LongList {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: String;
    h: String?;
    i: Cell;
    j: Slice;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = myAddress();
        self.f = null;
        self.g = "g";
        self.h = null;
        self.i = emptyCell();
        self.j = emptyCell().asSlice();
    }
}