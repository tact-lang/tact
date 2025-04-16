contract MultipleTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    optI: Int?;
    optS: String?;

    init() {
        self.i = 1;
        self.b = false;
        self.s = "X";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.optI = null;
        self.optS = null;
    }
}