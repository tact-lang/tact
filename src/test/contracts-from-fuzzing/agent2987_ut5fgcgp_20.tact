contract OptionalAddressSlice {
    a: Address?;
    s: Slice?;

    init() {
        self.a = null;
        self.s = null;
    }
}
