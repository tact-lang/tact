contract OptionalOfAddressAndSlice {
    a: Address?;
    b: Slice?;
    c: Cell?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
