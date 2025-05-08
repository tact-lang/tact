struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Bool?
}

contract LargeFields {
    st: LargeStruct;

    init() {
        self.st = LargeStruct{
            f1: 1,
            f2: true,
            f3: "a",
            f4: null,
            f5: null,
            f6: null,
            f7: 7,
            f8: false,
            f9: "z",
            f10: null,
        };
    }
}