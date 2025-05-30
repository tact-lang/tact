struct Wide {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int = 7;
    f8: Bool = false;
    f9: String = "abc";
    f10: Int?;
    f11: Bool = true;
    f12: Int = 12;
    f13: Int?;
    f14: Int?;
    f15: Int = 15;
}

contract Test {
    w: Wide;

    init() {
        self.w = Wide{
            f1: 1,
            f2: true,
            f3: "x",
            f4: null,
            f5: null,
            f6: null,
            f10: null,
            f13: null,
            f14: null
        };
    }
}