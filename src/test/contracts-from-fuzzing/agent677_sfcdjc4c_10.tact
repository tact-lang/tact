contract ParamsLarge(
    p0: Int,
    p1: Int as uint32,
    p2: Int as int8,
    p3: Bool,
    p4: String,
    p5: Bool,
    p6: Int,
    p7: Bool,
    p8: String,
    p9: Int?,
    p10: Bool?,
    p11: String?,
    p12: Int as uint128,
    p13: Bool,
    p14: String,
) {
    receive() {
        let _ = self.p0 + self.p6;
    }
}