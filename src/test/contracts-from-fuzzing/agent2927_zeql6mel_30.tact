// optional slice and cell persistent storage fields
contract OptRefFields {
    s: Slice?;
    c: Cell?;

    init() {
        self.s = null;
        self.c = null;
    }
}