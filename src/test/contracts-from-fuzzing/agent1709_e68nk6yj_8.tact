struct StringFields {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract LongStrings {
    data: StringFields;
    init() {
        self.data = StringFields{
            s1: "aaa",
            s2: "bbb",
            s3: "ccc",
            s4: "ddd",
            s5: "eee",
        };
    }
}