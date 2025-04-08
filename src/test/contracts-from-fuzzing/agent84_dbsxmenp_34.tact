// Large contract with many fields initialized through contract parameters
contract ParamsTest(
    a: Int,
    b: Bool,
    c: String,
    d: Cell,
    e: Address,
    f: Slice,
    g: Int?,
    h: String?,
    i: Bool?,
    j: Cell?,
    k: Address?,
    l: Slice?
) {
    receive() {
        // no-op
    }
}
