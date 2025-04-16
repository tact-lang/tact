contract Test(
    // many nullable fields
    a: Int?,
    b: Bool?,
    c: Address?,
    d: String?,
    e: Cell?,
    f: Slice?,
) {
    receive() {
        let _ = self.a;
    }
}