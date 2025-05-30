contract ScalarVariety {
    i: Int;
    b: Bool;
    a: Address;
    s: String;
    c: Cell;
    builder: Builder;
    sl: Slice;

    init() {
        self.i = 42;
        self.b = true;
        self.a = myAddress();
        self.s = "text";
        self.c = emptyCell();
        self.builder = beginCell();
        self.sl = emptyCell().asSlice();
    }
}