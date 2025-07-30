contract TestContract {
    a: Bool;
    b: Bool?;
    c: Int;
    d: Int?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice;
    i: Address;

    init() {
        self.a = true;
        self.b = null;
        self.c = 10;
        self.d = null;
        self.e = "okay";
        self.f = null;
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = myAddress();
    }
}
