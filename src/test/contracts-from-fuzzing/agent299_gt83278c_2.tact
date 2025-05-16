contract TestContract {
    a: Int;
    b: Int as uint8;
    c: Int as int32;
    d: Bool;
    e: Address;
    f: Cell;
    g: Slice;
    h: String;

    init() {
        self.a = 1;
        self.b = 255;
        self.c = -123456;
        self.d = true;
        self.e = myAddress();
        self.f = emptyCell();
        self.g = emptyCell().asSlice();
        self.h = "test";
    }
}