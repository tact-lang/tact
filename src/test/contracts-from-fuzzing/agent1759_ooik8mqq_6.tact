struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: String;
    f7: Int;
    f8: Int?;
    f9: Bool;
    f10: String;
}

contract LargeFields {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            f1: 1,
            f2: true,
            f3: null,
            f4: false,
            f5: "abc",
            f6: "def",
            f7: 7,
            f8: 8,
            f9: true,
            f10: "ghi",
        };
    }
}
