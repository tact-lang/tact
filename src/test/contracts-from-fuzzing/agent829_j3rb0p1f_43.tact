contract ContractParams(
    a: Int,
    b: Bool,
    c: String?,
    d: Int?,
    e: Bool?,
    f: String
) {
    receive() {
        let x = self.a + 1;
    }
}