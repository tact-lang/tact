contract Test(
    i: Int,
    b: Bool,
    s: String,
    a: Address,
    c: Cell,
    slice: Slice,
) {
    receive() {
        let _ = self.i + (self.b ? 1 : 0);
    }
}
