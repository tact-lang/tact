struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Int;
    f6: Int?;
    f7: Bool;
    f8: Bool?;
    f9: Int;
    f10: Bool;
}

contract BigStructUsage {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            f1: 1,
            f2: true,
            f3: null,
            f4: false,
            f5: 5,
            f6: 6,
            f7: false,
            f8: null,
            f9: 9,
            f10: true,
        };
    }
}
