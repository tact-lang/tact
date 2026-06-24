struct StringsStruct {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
    s5: String;
}

contract StringHeavyContract {
    data: StringsStruct;

    init() {
        self.data = StringsStruct{
            s1: "abc",
            s2: null,
            s3: "def",
            s4: "ghi",
            s5: "jkl",
        };
    }
}
