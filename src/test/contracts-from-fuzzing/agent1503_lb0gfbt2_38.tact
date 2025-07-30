struct Info {
    a: Int as uint8;
    b: Bool?;
    c: String;
}

contract ParamLong(
    p1: Int,
    p2: Int?,
    p3: Bool,
    p4: Bool?,
    p5: String,
    p6: String?,
    p7: Int as int16,
    p8: Int? as int16,
    p9: Address,
    p10: Address?,
    p11: Info,
    p12: Info?,
    p13: String,
    p14: Int,
    p15: Bool
) {
    receive() {}
}