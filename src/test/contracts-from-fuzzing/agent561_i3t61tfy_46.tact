contract OptionalSliceAddressCell {
    s: Slice?;
    a: Address?;
    c: Cell?;

    init() {
        self.s = null;
        self.a = null;
        self.c = null;
    }
}