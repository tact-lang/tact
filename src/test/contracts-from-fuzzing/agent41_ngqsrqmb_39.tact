// Try optional slice and cell serialization
contract OptSliceCell {
    s: Slice?;
    c: Cell?;
    init() {
        self.s = null;
        self.c = null;
    }
}