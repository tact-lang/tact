contract MultiFieldTest {
    a: Int;
    b: Int as uint32;
    c: Bool;
    d: String;
    e: Address;
    f: Cell;
    g: Slice;
    h: map<Int, Int>;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = "test";
        self.e = myAddress();
        self.f = emptyCell();
        self.g = self.f.asSlice();
        self.h = emptyMap();
    }
}