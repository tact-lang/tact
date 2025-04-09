contract WidePrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int as uint8;
    h: Int as int128;
    i: Bool;
    j: Address;
    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "hello";
        self.g = 255;
        self.h = -123456789;
        self.i = false;
        self.j = myAddress();
    }
}