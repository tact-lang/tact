contract ManyTypes {
    a: Int = 0;
    b: Bool = false;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "hi";
    g: Int? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "hello";
        self.g = null;
    }
}