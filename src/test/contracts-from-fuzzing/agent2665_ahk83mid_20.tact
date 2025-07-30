contract ManyMixedDefaults {
    a: Int = 10;
    b: Bool = false;
    c: Address;
    s: String = "hello";
    d: Cell;
    sl: Slice;

    init() {
        self.c = myAddress();
        self.d = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}