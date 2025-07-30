contract OptionMix {
    i: Int?;
    b: Bool;
    s: String?;
    c: Cell;
    sl: Slice?;

    init() {
        self.i = null;
        self.b = true;
        self.s = null;
        self.c = emptyCell();
        self.sl = null;
    }
}