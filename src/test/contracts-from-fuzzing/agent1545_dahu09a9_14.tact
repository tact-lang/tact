contract ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;

    init() {
        self.i = 5;
        self.b = true;
        self.s = "hello";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.a = myAddress();
    }
}
