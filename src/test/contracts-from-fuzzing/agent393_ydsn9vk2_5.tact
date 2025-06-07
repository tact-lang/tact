struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int;
    f5: Bool;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int;
}

contract BigFields {
    s: LongStruct = LongStruct{
        f1: 1,
        f2: true,
        f3: "a",
        f4: 2,
        f5: false,
        f6: "b",
        f7: 3,
        f8: true,
        f9: "c",
        f10: 4,
    };
    init() {
        self.s = LongStruct{
            f1: 10,
            f2: false,
            f3: "x",
            f4: 20,
            f5: true,
            f6: "y",
            f7: 30,
            f8: false,
            f9: "z",
            f10: 40,
        };
    }
}