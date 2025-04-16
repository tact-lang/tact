contract ManyTypes {
    i: Int;
    bl: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bld: Builder;

    init() {
        self.i = 42;
        self.bl = true;
        self.s = "text";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.bld = beginCell();
    }
}