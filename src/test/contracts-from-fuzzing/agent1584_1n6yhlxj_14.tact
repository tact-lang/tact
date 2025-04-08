contract TestContract {
    sc: Slice;
    oc: Cell?;
    os: Slice?;
    c: Cell;

    init() {
        self.sc = emptyCell().asSlice();
        self.c = emptyCell();
        self.oc = null;
        self.os = null;
    }

    receive() {
        self.oc = emptyCell();
        self.os = emptyCell().asSlice();
    }
}
