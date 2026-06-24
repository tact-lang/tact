contract OnlyContractParams(
    a: Int,
    b: Int,
    c: Bool,
    d: String,
    e: String?,
    f: Bool?,
) {
    get fun get_d(): String { return self.d; }
}