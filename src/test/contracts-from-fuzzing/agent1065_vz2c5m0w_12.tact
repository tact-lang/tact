struct StringFields {
    s1: String;
    s2: String;
    s3: String;
}

contract MultipleStrings {
    stuff: StringFields;

    init() {
        self.stuff = StringFields{
            s1: "a",
            s2: "b",
            s3: "c",
        };
    }
}
