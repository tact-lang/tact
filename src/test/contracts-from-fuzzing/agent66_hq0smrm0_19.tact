struct Wide {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: String;
    f5: Bool?;
    f6: String?;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Int;
    f12: Int;
    f13: Int;
    f14: Int;
    f15: Int;
    f16: Int;
}

contract Test {
    w: Wide;
    init() {
        self.w = Wide{
            f1: 1,
            f2: true,
            f3: null,
            f4: "a",
            f5: null,
            f6: null,
            f7: 7,
            f8: 8,
            f9: 9,
            f10: 10,
            f11: 11,
            f12: 12,
            f13: 13,
            f14: 14,
            f15: 15,
            f16: 16,
        };
    }
}
