contract TestContract(
    a: Int,
    b: Bool,
    c: Address,
    d: String,
    e: Cell,
    f: Builder,
    g: Slice
) {
    receive() {
        let _ = self.a + 1;
    }
}