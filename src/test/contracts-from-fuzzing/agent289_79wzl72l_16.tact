contract MixedTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;

    init() {
        self.i = 10;
        self.b = true;
        self.s = "text";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}