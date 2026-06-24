contract ManyFieldsDiffTypes {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Cell;
    f: Address;
    g: Slice;

    init() {
        self.a = 1;
        self.b = null;
        self.c = false;
        self.d = "str";
        self.e = emptyCell();
        self.f = myAddress();
        self.g = emptyCell().asSlice();
    }
}