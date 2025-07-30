struct LongList {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String?;
    f6: Bool;
    f7: Int;
    f8: String;
    f9: Bool;
    f10: Int;
    f11: Bool;
    f12: Int;
    f13: String;
    f14: Bool;
    f15: String?;
    f16: Int?;
}

contract LongStructFields {
    container: LongList;

    init() {
        self.container = LongList{
            f1: 1,
            f2: true,
            f3: "x",
            f4: null,
            f5: null,
            f6: false,
            f7: 2,
            f8: "y",
            f9: true,
            f10: 3,
            f11: false,
            f12: 4,
            f13: "z",
            f14: true,
            f15: null,
            f16: null
        };
    }
}