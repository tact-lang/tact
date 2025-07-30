// contract with string + int + cell + slice + bool chain persistent state
contract Chain {
    s: String;
    i: Int;
    c: Cell;
    sl: Slice;
    b: Bool;

    init() {
        self.s = "hello";
        self.i = 77;
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
        self.b = true;
    }
}
