struct S {
    s1: Int;
    s2: Bool;
}

contract ManyParams(
    f1: Int,
    f2: Bool,
    f3: String,
    f4: Int?,
    f5: String?,
    f6: Bool?,
    f7: Int as uint32,
    f8: Int as int64,
    f9: Int,
    f10: Int?,
    f11: Bool,
    f12: String,
    f13: Bool?,
    f14: Int,
    f15: String?,
    f16: S,
    f17: S?,
    f18: Int as uint8,
    f19: Int as int32,
    f20: Bool
) {
    receive() {
        let _ = 1;
    }
}