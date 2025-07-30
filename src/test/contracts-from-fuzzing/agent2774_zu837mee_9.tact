// contract using contract-parameters syntax with persistent diverse fields
contract ParamContract(
    a: Int,
    b: Bool,
    c: String,
    d: Int?,
    e: Bool?,
    f: String?,
    g: Address?,
    h: Cell?,
    i: Slice?
) {
    receive() {
        // do nothing, to include in compilation
    }
}