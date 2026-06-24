contract MultiFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: Address;
    g: Cell;
    h: Slice;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "test";
        self.d = null;
        self.e = true;
        self.f = myAddress();
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
    }
}