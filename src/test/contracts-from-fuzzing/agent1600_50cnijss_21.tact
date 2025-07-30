contract TestContract(
    a: Int,
    b: Bool,
    c: String,
    d: Address,
    e: Int,
    f: Bool,
    g: String,
    h: Address,
    i: Int,
    j: Bool,
    k: String,
    l: Address
) {
    receive() {
        // Access some params
        let _ = self.a + self.e + self.i;
    }
}