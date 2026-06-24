contract ManyTypes {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint256;
    e: Bool;
    f: Address;
    g: Cell;
    h: Slice;
    i: String;

    init() {
        self.a = 0;
        self.b = 255;
        self.c = -1000;
        self.d = 123456789012345;
        self.e = true;
        self.f = myAddress();
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = "test";
    }
}