contract ManyFields {
    a: Bool;
    b: Int;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;

    init() {
        self.a = true;
        self.b = 42;
        self.c = "Hello";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
    }
}