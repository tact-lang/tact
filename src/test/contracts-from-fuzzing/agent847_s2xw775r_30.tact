contract ContractParamsOnly(
    a: Int,
    b: String,
    c: Bool,
    d: Address,
    e: Slice,
    f: Cell,
) {
    receive() {
        let _ = self.a + 1;
        let _ = self.b;
        let _ = !self.c;
        let _ = self.d;
        let _ = self.e;
        let _ = self.f;
    }
}