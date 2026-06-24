// Test contract default zero init for primitive persistent fields
contract ZeroDefaults {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;

    init() {
        self.i = 0;
        self.b = false;
        self.s = "";
        self.a = myAddress();
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}