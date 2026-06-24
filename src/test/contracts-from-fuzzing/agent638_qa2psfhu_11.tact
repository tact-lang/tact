struct Sub {
    id: Int;
    label: String?;
}

contract WideParams(
    p1: Int,
    p2: Int as uint8,
    p3: Int as int64,
    p4: Bool,
    p5: Bool?,
    p6: String,
    p7: String?,
    p8: Cell?,
    p9: Slice?,
    p10: Address?,
    p11: Sub?,
    p12: Sub,
) {
    receive() {}
}