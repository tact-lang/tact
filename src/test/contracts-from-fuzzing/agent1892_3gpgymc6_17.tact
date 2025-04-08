struct BigStruct {
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

contract BigFieldsContract {
    s: BigStruct;
    
    init() {
        self.s = BigStruct{
            f1: 1,
            f2: false,
            f3: "",
            f4: 4,
            f5: true,
            f6: "s",
            f7: -7,
            f8: false,
            f9: "end",
            f10: 10,
        };
    }
}