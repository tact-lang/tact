// test optional slices and cells with serialization specifiers
contract OptSliceCell {
    s: Slice?;
    c: Cell?;

    init() {
        self.s = null;
        self.c = null;
    }
}