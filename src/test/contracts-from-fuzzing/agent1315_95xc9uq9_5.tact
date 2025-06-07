contract MixedTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;

    init() {
        self.i = 123;
        self.b = true;
        self.s = "test";
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.a = myAddress();
    }
}