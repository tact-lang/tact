// Contract params variant with many persistents
contract ParamHeavy(
    a: Int,
    b: Bool,
    c: Bool?,
    d: String,
    e: String?,
    f: Int?,
    g: Bool?,
    h: Int,
    i: String,
    j: Bool,
) {
    receive() {
        // do nothing, just to ensure contract builds
    }
}