contract TestManyTypes {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address;
    f: Cell;
    g: Slice;
    h: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = myAddress();
        self.f = emptyCell();
        self.g = emptyCell().asSlice();
        self.h = "test";
    }
}