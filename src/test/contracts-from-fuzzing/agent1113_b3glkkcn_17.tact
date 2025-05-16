contract Primitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;

    init() {
        self.i = 0;
        self.b = true;
        self.s = "hello";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = self.c.asSlice();
    }
}