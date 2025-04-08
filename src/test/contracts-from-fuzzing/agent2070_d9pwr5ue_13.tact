struct BigStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Bool;
    f6: String;
    f7: Bool?;
    f8: Int?;
    f9: String?;
    f10: Bool;
    f11: Int as int64;
    f12: Int as uint32;
}

contract HasBigStruct {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            f1: 1,
            f2: 2,
            f3: 3,
            f4: 4,
            f5: true,
            f6: "str6",
            f7: null,
            f8: null,
            f9: null,
            f10: true,
            f11: 42,
            f12: 12,
        };
    }
}
