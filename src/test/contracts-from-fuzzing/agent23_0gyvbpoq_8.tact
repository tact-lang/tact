struct StringFields {
    s1: String;
    s2: String;
    s3: String;
}

contract MultiString {
    val: StringFields;

    init() {
        self.val = StringFields{
            s1: "first",
            s2: "second",
            s3: "third"
        };
    }
}