struct BigStruct {
    f1: Int;
    f2: Int?;
    f3: String;
    f4: Bool;
    f5: String?;
    f6: Bool?;
    f7: Int;
    f8: Int?;
    f9: String;
    f10: Bool;
}

contract ManyFields {
    val: BigStruct;

    init() {
        self.val = BigStruct{
            f1: 1,
            f2: 2,
            f3: "x",
            f4: true,
            f5: null,
            f6: false,
            f7: 42,
            f8: null,
            f9: "end",
            f10: true,
        };
    }
}
