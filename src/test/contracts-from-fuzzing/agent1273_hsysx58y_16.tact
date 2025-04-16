contract OrderTest {
    a: Int as uint8;
    b: Int as uint4;
    c: Int;
    d: Bool;
    e: String;
    f: Slice;
    g: Address;

    init() {
        self.a = 255;
        self.b = 15;
        self.c = 123456;
        self.d = true;
        self.e = "hi";
        self.f = emptyCell().asSlice();
        self.g = myAddress();
    }
}