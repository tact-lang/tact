contract AllPrimitiveStorage {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    slice: Slice;
    str: String;

    init() {
        self.i = 0;
        self.b = true;
        self.a = myAddress();
        self.c = emptyCell();
        self.slice = emptyCell().asSlice();
        self.str = "data";
    }
}
