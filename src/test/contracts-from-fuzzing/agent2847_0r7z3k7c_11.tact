struct StringsStruct {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract ManyStrings {
    vals: StringsStruct;

    init() {
        self.vals = StringsStruct{
            s1: "a",
            s2: "b",
            s3: "c",
            s4: "d",
            s5: "e",
        };
    }
}