contract TestContract(
    a: Int,
    b: Bool,
    c: Address,
    d: String,
    e: Int?,
    f: Bool?,
    g: Address?,
    h: String?,
    i: Int,
    j: Bool,
    k: String,
    l: Address
) {
    receive() {
        let _ = self.a;
    }
}