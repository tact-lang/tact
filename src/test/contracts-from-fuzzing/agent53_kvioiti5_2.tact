contract MultiTypeFields {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    str: String;

    init() {
        self.i = 42;
        self.b = true;
        self.a = myAddress();
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.str = "hello";
    }
}