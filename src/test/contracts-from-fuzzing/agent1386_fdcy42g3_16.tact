struct StringFields {
    s1: String;
    s2: String;
    s3: String;
}

contract StringHolder {
    vals: StringFields;
    init() {
        self.vals = StringFields{
            s1: "abc",
            s2: "def",
            s3: "ghi"
        };
    }
}