struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int;
}

contract ManyFields {
    b: BigStruct;

    init() {
        self.b = BigStruct{
            f1: 1,
            f2: false,
            f3: "hi",
            f4: null,
            f5: true,
            f6: null,
            f7: 2,
            f8: true,
            f9: "yo",
            f10: 3
        };
    }
}
