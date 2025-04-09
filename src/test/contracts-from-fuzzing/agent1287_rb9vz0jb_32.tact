// Large contract params with deep/optional struct param
struct WrappedOpt {
    a: Int?;
    b: Bool?;
}

contract LargeParam(
    i: Int,
    s: String,
    addr: Address,
    slice: Slice,
    w: WrappedOpt?,
    optBool: Bool?,
    optStr: String?,
    b: Bool
) {
    get fun dummy(): Bool { return false; }
}