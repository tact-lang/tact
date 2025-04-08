struct Massive {
    f0: Int;
    f1: Bool;
    f2: String?;
    f3: Bool;
    f4: String;
    f5: Int?;
    f6: Bool?;
    f7: String;
    f8: String?;
    f9: Int;
    f10: Bool;
    f11: Int?;
    f12: String;
    f13: Bool?;
    f14: Int;
    f15: String?;
    f16: Bool;
    f17: Int?;
    f18: String;
    f19: Bool?;
}

contract Combos {
    m: Massive;
    init() {
        self.m = Massive{
            f0: 0,
            f1: false,
            f2: null,
            f3: true,
            f4: "a",
            f5: null,
            f6: null,
            f7: "b",
            f8: null,
            f9: 9,
            f10: true,
            f11: null,
            f12: "c",
            f13: null,
            f14: 14,
            f15: null,
            f16: false,
            f17: null,
            f18: "d",
            f19: null,
        };
    }
}