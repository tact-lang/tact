contract OptContractFields(
    a: Int?,
    b: Bool?,
    c: String?,
    d: Int,
    e: Bool,
    f: String
) {
    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
        let _ = self.e;
        let _ = self.f;
    }
}
