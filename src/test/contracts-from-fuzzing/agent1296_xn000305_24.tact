contract TestContract(
    a: Int,
    b: Bool,
    c: Address?,
    d: Bool?,
    e: Int?,
) {
    receive() {
        // use
        let _ = self.a + 1;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
        let _ = self.e;
    }
}