contract Complex(
    u8: Int as uint8,
    u16: Int as uint16,
    u64: Int as uint64,
    coinsVal: Int as coins,
    optInt: Int?,
    optBool: Bool?,
    addr: Address,
    s: String,
    c: Cell,
    sl: Slice,
) {
    receive() {
        let _ = self.u16 + (self.optBool != null && self.optBool!! ? 1 : 0);
    }
}
