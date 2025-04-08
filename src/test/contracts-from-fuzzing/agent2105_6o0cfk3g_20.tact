struct StringFields {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    s: StringFields;

    init() {
        self.s = StringFields{
            s1:"a",
            s2:"b",
            s3:"c",
        };
    }
}