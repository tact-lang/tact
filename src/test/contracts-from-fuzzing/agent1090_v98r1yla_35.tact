struct PNested {
    inner: Int?;
}

contract MultiParamsOptional(
    a: Int?,
    b: String?,
    c: Bool?,
    d: PNested?,
) {
}