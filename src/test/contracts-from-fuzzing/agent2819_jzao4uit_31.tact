// contract parameters with many primitives and optionals
contract TestContract(
    a: Int,
    b: Int?,
    c: Bool,
    d: Bool?,
    e: String,
    f: String?
) {
    receive() {
        dump(self.a);
    }
}