contract ParamsTest(
    a: Int,
    b: Int?,
    c: Bool,
    d: Bool?,
    e: Address,
    f: Address?,
    g: Cell,
    h: Cell?,
    i: String,
    j: String?,
) {
    get fun getA(): Int { return self.a; }
}