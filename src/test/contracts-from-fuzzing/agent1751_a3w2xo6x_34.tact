contract OptionalAddressAndSlice {
    addr: Address?;
    sl: Slice?;

    init() {
        self.addr = null;
        self.sl = null;
    }
}
