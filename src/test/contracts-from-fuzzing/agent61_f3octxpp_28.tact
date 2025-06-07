contract CombinationFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Slice;
    f: Cell;
    g: Address;

    init() {
        self.a = 10;
        self.b = null;
        self.c = true;
        self.d = "Hello";
        self.e = emptyCell().asSlice();
        self.f = emptyCell();
        self.g = myAddress();
    }
}