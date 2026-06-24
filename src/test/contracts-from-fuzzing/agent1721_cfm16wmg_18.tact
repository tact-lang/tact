contract OrderTest {
    a: Int as uint8;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;

    init() {
        self.a = 255;
        self.b = true;
        self.c = "abc";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
    }
}