struct StringFields {
    s1: String;
    s2: String;
    s3: String?;
    s4: String?;
}

contract Strings {
    data: StringFields;

    init() {
        self.data = StringFields{
            s1: "hi",
            s2: "bye",
            s3: null,
            s4: null,
        };
    }
}