struct LargeStruct {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int;
}

contract BigPersistent {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            f1: 1,
            f2: 2,
            f3: false,
            f4: null,
            f5: "a",
            f6: "b",
            f7: 7,
            f8: true,
            f9: "c",
            f10: 9,
        };
    }
}