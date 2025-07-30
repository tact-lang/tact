contract ParamsOnly(
    a: Int,
    b: String,
    c: Address?,
    d: Bool,
    e: Bool?,
    f: Int?
) {
    receive() {
        // just a dummy to force full compile
    }
}