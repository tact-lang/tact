contract ManyTypes {
    i: Int;
    b: Bool;
    a: Address;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;

    init() {
        self.i = 1;
        self.b = true;
        self.a = myAddress();
        self.s = "abc";
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.bu = beginCell();
    }
}