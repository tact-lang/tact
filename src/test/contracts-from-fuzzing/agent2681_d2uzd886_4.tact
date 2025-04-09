struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: String?;
    f6: Int?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
}

contract BigFields {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            f1: 1,
            f2: true,
            f3: "hi",
            f4: null,
            f5: null,
            f6: null,
            f7: 7,
            f8: false,
            f9: "bye",
            f10: null,
        };
    }
}