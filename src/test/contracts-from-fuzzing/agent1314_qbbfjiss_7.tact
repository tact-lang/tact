struct BigStruct {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    s6: String;
    s7: String;
    s8: String;
    s9: String;
    s10: String;
}

contract BigStructContract {
    bs: BigStruct;

    init() {
        self.bs = BigStruct{
            s1: "a",
            s2: "b",
            s3: "c",
            s4: "d",
            s5: "e",
            s6: "f",
            s7: "g",
            s8: "h",
            s9: "i",
            s10: "j",
        };
    }
}