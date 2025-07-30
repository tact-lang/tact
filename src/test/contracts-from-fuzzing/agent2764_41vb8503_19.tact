contract OnlyContractParam(
    a: Int,
    b: Bool,
    c: String,
    d: Address,
    e: Cell,
    f: Slice,
    g: Int?,
    h: Bool?,
    i: String?,
    j: Address?,
    k: Cell?,
    l: Slice?,
) {
    receive() {
        // do nothing, just to compile
        let _ = 1;
    }
}